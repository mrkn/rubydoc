RubyGems の Gem ファイルの内部構造を扱うためのライブラリです。

@see [[lib:rubygems/format]]

= class Gem::OldFormat

RubyGems の Gem ファイルの内部構造を表すクラスです。

@see [[c:Gem::Format]]

== Public Instance Methods

--- file_entries -> Array
#@todo

Gem パッケージに含まれるファイルの配列を返します。

--- file_entries=(file_entries)
#@todo

Gem パッケージに含まれるファイルの配列をセットします。

@param file_entries

--- gem_path -> String
#@todo

Gem のパスを返します。

--- gem_path=(path)
#@todo

Gem のパスをセットします。

@param path Gem のパスをセットします。

--- spec -> Gem::Specification
#@todo

Gem の [[c:Gem::Specification]] を返します。

--- spec=(spec)
#@todo

Gem の [[c:Gem::Specification]] をセットします。

@param spec Gem の [[c:Gem::Specification]] をセットします。

== Singleton Methods

--- from_file_by_path(file_path) -> Gem::OldFormat
#@todo

Gem ファイルのパスからデータを読み込んで、自身を初期化して返します。

@param file_path Gem ファイルへのパスを指定します。

--- from_io(io, gem_path = '(io)') -> Gem::OldFormat
#@todo

Gem ファイルからデータを読み込んだ IO を受け取り、自身を初期化して返します。

@param io Gem パッケージの内容を読み込んだ IO オブジェクトを指定します。

@param gem_path Gem ファイルのパスを指定します。

--- new(gem_path)
#@todo

自身を初期化します。

@param gem_path Gem ファイルへのパスを指定します。
