
= class Test::Unit::TestSuite < Object

複数のテストをひとつにまとめたクラスです。TestSuite 同士をまとめてひとつの
TestSuite にすることもできます。
[[m:Test::Unit::TestSuite#run]] によりまとめたテストを一度に
実行することができます。テストは TestSuite へ加えられた順に実行されます。
自身が TestSuite を含んでいる場合は、再帰的にテストを実行します。

== Class Methods

--- new(name = "Unnamed TestSuite")   -> Test::Unit::TestSuite

TestSuite のインスタンスを生成して返します。

@param name 生成する TestSuite の名前です。文字列で与えます。

== Instance Methods

--- <<(test)    -> self

自身にテストを加えます。self を返します。

@param test 自身に加える TestCase か TestSuite のインスタンスを与えます。

#@since 1.8.1
--- ==(other)    -> bool
#@todo

It's handy to be able to compare TestSuite instances.

--- delete(test)    -> ()

test と等しいもの全てを自身から削除します。test と等しい要素が見つかった場合は、testを返します。
test と等しいものがなければ nil を返します

@param test  自身から削除する TestCase か TestSuite のインスタンスを与えます。

#@end

--- empty?    -> bool
実行すべきテストが空なら true を返します。そうでないなら false を返します。

--- run(result) {|STARTED, name| ...}    -> ()

このメソッドをユーザが直接呼ぶことはありません。

自身が持っているテストを実行します。
このメソッドは TestRunner オブジェクトから呼ばれます。

テストは TestSuite へ加えられた順に実行されます。
自身が TestSuite を含んでいる場合は、再帰的にテストを実行します。

@param result TestResult オブジェクトを与えます。

--- size    -> Integer

実行するテストの総数を返します。
もし自身が他の TestSuite を含んでいる場合は、その TestSuite が
持っているテストを再帰的に合計した数を返します。

--- to_s    -> String
#@todo

Overridden to return the name given the suite at creation.

--- name    -> String
#@todo

--- tests    -> [ Test::Unit::TestSuite | Test::Unit::TestCase ]
#@todo
