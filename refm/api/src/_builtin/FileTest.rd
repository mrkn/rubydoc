= module FileTest

FileTest はファイルの検査関数を集めたモジュールです。このモジュー
ルはインクルードしても使えます。

== Module Functions

--- blockdev?(filename)

filename がブロックスペシャルファイルである時、真を返します。

--- chardev?(filename)

filename がキャラクタスペシャルファイルの時、真を返します。

--- executable?(filename)

filename が実効ユーザ/グループ ID で実行できる時、真を返しま
す。

--- executable_real?(filename)

filename が実ユーザ/グループ ID で実行できる時、真を返します。

--- exist?(filename)

filename が存在する時、真を返します。

--- exists?(filename)

filename が存在する時、真を返します。
このメソッドはobsoleteです。
[[m:FileTest.exist?]]を使って下さい。

--- grpowned?(filename)

filename のグループ ID が実行グループ ID と等しい時、真を返
します。

--- directory?(filename)

filename がディレクトリの時、真を返します。

--- file?(filename)

filaname が通常ファイルである時、真を返します。

#@since 1.8.4
--- identical?(filename1, filename2)

filaname1 と filename2 が同じファイルを指している時、真を返します。

(ruby 1.8.3 以前では[[m:Kernel#test]](?-, filename1, filename2)を使ってください。)

例:

  open("a", "w") {}
  p File.identical?("a", "a")      #=> true
  p File.identical?("a", "./a")    #=> true
  File.link("a", "b")
  p File.identical?("a", "b")      #=> true
  File.symlink("a", "c")
  p File.identical?("a", "c")      #=> true
  open("d", "w") {}
  p File.identical?("a", "d")      #=> false
#@end
--- pipe?(filename)

filename が名前つきパイプ(FIFO)である時、真を返します。

--- socket?(filename)

filename がソケットである時、真を返します。

--- owned?(filename)

filename が自分のものである時に真を返します。

--- readable?(filename)

filename を読み込み可能な時に真を返します。

--- readable_real?(filename)

filename が実ユーザ/実グループによって読み込み可能な時に真を
返します。

--- setuid?(filename)

filename が [[man:setuid(2)]] されている時に真を返
します。

--- setgid?(filename)

filename が [[man:setgid(2)]] されている時に真を返
します。

--- size(filename)

filename のサイズを返します。filename が存在しなければ
例外 [[c:Errno::EXXX]](おそらく Errno::ENOENT)が発生します。

[[m:FileTest.size?]], [[m:FileTest.zero?]] も参
照してください。

--- size?(filename)

filename のサイズを返します。filename が存在しない時や
filename のサイズが0の時には nil を返します。

[[m:FileTest.size]], [[m:FileTest.zero?]] も参照
してください。

--- sticky?(filename)

filename の sticky ビット([[man:chmod(2)]] 参照)が
立っている時に真を返します。

--- symlink?(filename)

filename がシンボリックリンクである時、真を返します。

--- writable?(filename)

filename が書き込み可である時、真を返します。

--- writable_real?(filename)

filename が実ユーザ/実グループによって書き込み可である時、真
を返します。

--- zero?(filename)

filename が存在して、そのサイズが 0 である時、真を返します。
filename が存在しない場合は false を返します。

[[m:FileTest.size]], [[m:FileTest.size?]], も参
照してください。

#@since 1.9.0
#@# bc-rdoc: detected missing name: world_readable?
--- world_readable?(file_name)   => fixnum or nil

If file_name is readable by others, returns an integer representing
the file permission bits of file_name. Returns nil otherwise.
The meaning of the bits is platform dependent; on Unix systems,
see stat(2).

   File.world_readable?("/etc/passwd")           # => 420
   m = File.world_readable?("/etc/passwd")
   sprintf("%o", m)                              # => "644"

#@# bc-rdoc: detected missing name: world_writable?
--- world_writable?(file_name)   => fixnum or nil

If file_name is writable by others, returns an integer representing
the file permission bits of file_name. Returns nil otherwise.
The meaning of the bits is platform dependent; on Unix systems,
see stat(2).

   File.world_writable?("/tmp")                  #=> 511
   m = File.world_writable?("/tmp")
   sprintf("%o", m)                              #=> "777"
#@end
