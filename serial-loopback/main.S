#define RHR 0                 // receive holding register (for input bytes)
#define THR 0                 // transmit holding register (for output bytes)
#define LSR 5                 // line status register
#define LSR_RX_READY (1<<0)   // input is waiting to be read from RHR
#define LSR_TX_IDLE (1<<5)    // THR can accept another character to send
#define CR 0x0d
#define LF 0x0a

  .text
  .globl main
main:
  // シリアル入力から渡された文字を...
wait_input:
  call getc
  li a5, -1
  beq a0, a5, wait_input

  // シリアル出力へ渡す
  call putc
loop:
  j main

putc:
  // データ送信レジスタ(THR)へ書き込んだ値がシリアルへ出力される
  li a5, 0x10000000
  li t0, CR
  beq a0, t0, put_cr_lf
  sb a0, THR(a5)
  ret
put_cr_lf:
  // CRだけではいい感じに改行してくれないため、CRと一緒にLFも送信する
  li a0, CR
  sb a0, THR(a5)
  li a0, LF
  sb a0, THR(a5)
  ret

getc:
  li a5, 0x10000000
  // ラインステータスレジスタ（LSR）にLSR_RX_READYフラグが立っていればデータ受信済み
  lb a4, LSR(a5)
  andi a4, a4, LSR_RX_READY
  beqz a4, getc_empty
  // データ受信済みの場合
  // データ受信レジスタ(RHR)からシリアルへ入力された値を読み込んで返す
  lb a0, RHR(a5)
  ret
getc_empty:
  // データ未受信の場合
  // -1を返す
  li a0, -1
  ret
