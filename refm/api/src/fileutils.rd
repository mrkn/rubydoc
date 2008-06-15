�Ƶ�Ū�ʺ���ʤɤδ���Ū�ʥե���������Ԥ�����Υ饤�֥��Ǥ���

= module FileUtils

����Ū�ʥե��������򽸤᤿�⥸�塼��Ǥ���


====[a:options] ���ץ���������

���� options �ǻ��ѤǤ��륪�ץ����������Ǥ���
�᥽�åɤ��Ȥ˻��ѤǤ��륪�ץ����Ϸ�ޤäƤ��ޤ���
�����ʥ��ץ�����Ϳ����� [[c:ArgumentError]] ��ȯ�����ޤ���

: :noop
  ������ꤹ��ȼºݤν����ϹԤ��ޤ���
: :preserve
  ������ꤹ��ȹ�������ȡ���ǽ�ʤ��ͭ�桼������ͭ���롼�פ⥳�ԡ����ޤ���
: :verbose
  ������ꤹ��Ⱦܺ٤���Ϥ��ޤ���
: :mode
  �ѡ��ߥå�����8�ʿ��ǻ��ꤷ�ޤ���
: :force
  ������ꤹ��Ⱥ���椹�٤Ƥ� [[c:StandardError]] ��̵�뤷�ޤ���
: :nocreate
  ������ꤹ��ȥե������������ޤ���
: :dereference_root
  ������ꤹ��� src �ˤĤ��Ƥ�������ܥ�å���󥯤λؤ�
  ���Ƥ򥳥ԡ����ޤ������ξ��ϥ���ܥ�å���󥯼��Τ򥳥ԡ����ޤ���
: :remove_destination
  ������ꤹ��ȥ��ԡ���¹Ԥ������˥��ԡ���������ޤ���
: :secure
  ������ꤹ��ȥե�����κ���� [[m:FileUtils#remove_entry_secure]] ����Ѥ��ޤ���

== Module Functions

--- cd(dir, options = {})                   -> nil
--- cd(dir, options = {}) {|dir| .... }     -> ()
--- chdir(dir, options = {})                -> nil
--- chdir(dir, options = {}) {|dir| .... }  -> ()

�ץ����Υ����ȥǥ��쥯�ȥ�� dir ���ѹ����ޤ���

�֥�å��ȤȤ�˸ƤӽФ��줿���ϥ֥�å���λ���
���Υǥ��쥯�ȥ�����ޤ���

@param dir �ǥ��쥯�ȥ����ꤷ�ޤ���

#@since 1.8.3
@param options :verbose ������Ǥ��ޤ���
#@else
@param options :noop, :verbose ������Ǥ��ޤ���
#@end
               [[ref:options]]

��:

  FileUtils.cd('/', {:verbose => true})   # chdir and report it

--- chmod(mode, list, options = {}) -> Array

�ե����� list �Υѡ��ߥå����� mode ���ѹ����ޤ���

@param mode �ѡ��ߥå�����8�ʿ��ǻ��ꤷ�ޤ���

@param list �ե�����Υꥹ�Ȥ���ꤷ�ޤ��� �оݤΥե����뤬��Ĥξ���ʸ����Ǥ�����ǽ�Ǥ���
           ��İʾ���ꤹ���������ǻ��ꤷ�ޤ���

@param options :noop �� :verbose �������ǽ�Ǥ���
               [[ref:options]]

@return list ������Ȥ����֤��ޤ���

��:

  FileUtils.chmod(0644, ['my.rb', 'your.rb'])
  FileUtils.chmod(0755, 'somecommand')
  FileUtils.chmod(0755, '/usr/bin/ruby', {:verbose => true})

#@since 1.8.3
--- chmod_R(mode, list, options = {}) -> Array

�ե����� list �Υѡ��ߥå�����Ƶ�Ū�� mode ���ѹ����ޤ���

@param mode �ѡ��ߥå�����8�ʿ��ǻ��ꤷ�ޤ���

@param list �ե�����Υꥹ�Ȥ���ꤷ�ޤ����оݤΥե����뤬��Ĥξ���ʸ����Ǥ�����ǽ�Ǥ���
           ��İʾ���ꤹ���������ǻ��ꤷ�ޤ���

@param options :noop �� :verbose �������ǽ�Ǥ���
               [[ref:options]]

@return list ������Ȥ����֤��ޤ���

��:

  FileUtils.chmod_R(0700, '/tmp/removing')

#@end

#@since 1.8.3
--- chown(user, group, list, options = {}) -> Array

�ե����� list �ν�ͭ�桼���Ƚ�ͭ���롼�פ� user �� group ���ѹ����ޤ���

user, group �� nil �ޤ��� -1 ���Ϥ��Ȥ��ι��ܤ��ѹ����ޤ���

@param user �桼����̾�� uid ����ꤷ�ޤ���nil/-1 ����ꤹ����ѹ����ޤ���

@param group ���롼��̾�� gid ����ꤷ�ޤ���nil/-1 ����ꤹ����ѹ����ޤ���

@param list �ե�����Υꥹ�Ȥ���ꤷ�ޤ����оݤΥե����뤬��Ĥξ���ʸ����Ǥ�����ǽ�Ǥ���
           ��İʾ���ꤹ���������ǻ��ꤷ�ޤ���

@param options :noop �� :verbose �������ǽ�Ǥ���
               [[ref:options]]

@return list ������Ȥ����֤��ޤ���


��:

  FileUtils.chown 'root', 'staff', '/usr/local/bin/ruby'
  FileUtils.chown nil, 'bin', Dir.glob('/usr/bin/*'), :verbose => true
#@end

#@since 1.8.3
--- chown_R(user, group, list, options = {}) -> Array

list �ʲ��Υե�����ν�ͭ�桼���Ƚ�ͭ���롼�פ�
user �� group �غƵ�Ū���ѹ����ޤ���

user, group �� nil �ޤ��� -1 ���Ϥ��Ȥ��ι��ܤ��ѹ����ޤ���

@param user �桼����̾�� uid ����ꤷ�ޤ���nil/-1 ����ꤹ����ѹ����ޤ���

@param group ���롼��̾�� gid ����ꤷ�ޤ���nil/-1 ����ꤹ����ѹ����ޤ���

@param list �ե�����Υꥹ�Ȥ���ꤷ�ޤ����оݤΥե����뤬��Ĥξ���ʸ����Ǥ�����ǽ�Ǥ���
           ��İʾ���ꤹ���������ǻ��ꤷ�ޤ���

@param options :noop �� :verbose �������ǽ�Ǥ���
               [[ref:options]]

@return list ������Ȥ����֤��ޤ���

��:

  FileUtils.chown 'root', 'staff', '/usr/local/bin/ruby'
  FileUtils.chown nil, 'bin', Dir.glob('/usr/bin/*'), :verbose => true
  
  FileUtils.chown_R 'www', 'www', '/var/www/htdocs'
  FileUtils.chown_R 'cvs', 'cvs', '/var/cvs', :verbose => true
#@end

--- cmp(file_a, file_b)          -> bool
--- compare_file(file_a, file_b) -> bool
--- identical?(file_a, file_b)   -> bool

�ե����� a �� b �����Ƥ�Ʊ���ʤ鿿���֤��ޤ���

@param file_a �ե�����̾��

@param file_b �ե�����̾��

��:

  FileUtils.cmp('somefile', 'somefile')  #=> true
  FileUtils.cmp('/bin/cp', '/bin/mv')    #=> maybe false.

--- compare_stream(io_a, io_b) -> bool

[[c:IO]] ���֥������� io_a �� io_b �����Ƥ�Ʊ���ʤ鿿���֤��ޤ���

@param io_a [[c:IO]] ���֥������ȡ�

@param io_b [[c:IO]] ���֥������ȡ�

#@since 1.8.3
--- copy_entry(src, dest, preserve = false, dereference_root = false) -> ()

�ե����� src �� dest �˥��ԡ����ޤ���

src �����̤Υե�����Ǥʤ����Ϥ��μ��̤ޤǴޤ�ƴ����˥��ԡ����ޤ���
src ���ǥ��쥯�ȥ�ξ��Ϥ�����Ȥ�Ƶ�Ū�˥��ԡ����ޤ���

@param src ���ԡ�����

@param dest ���ԡ��衣

@param preserve preserve �����ΤȤ��Ϲ�������ȡ�
                ��ǽ�ʤ��ͭ�桼������ͭ���롼�פ⥳�ԡ����ޤ���

@param dereference_root dereference_root �����ΤȤ��� src �ˤĤ��Ƥ�������ܥ�å���󥯤λؤ�
                        ���Ƥ򥳥ԡ����ޤ������ξ��ϥ���ܥ�å���󥯼��Τ򥳥ԡ����ޤ���

#@end

#@since 1.8.3
--- copy_file(src, dest, preserve = false, dereference_root = true) -> ()

�ե����� src �����Ƥ� dest �˥��ԡ����ޤ���

@param src ���ԡ�����

@param dest ���ԡ��衣

@param preserve preserve �����ΤȤ��Ϲ�������ȡ�
                ��ǽ�ʤ��ͭ�桼������ͭ���롼�פ⥳�ԡ����ޤ���

@param dereference_root dereference_root �����ΤȤ��� src �ˤĤ��Ƥ�������ܥ�å���󥯤λؤ�
                        ���Ƥ򥳥ԡ����ޤ������ξ��ϥ���ܥ�å���󥯼��Τ򥳥ԡ����ޤ���

#@end

#@since 1.8.3
--- copy_stream(src, dest) -> ()

src �� dest �˥��ԡ����ޤ���
src �ˤ� read �᥽�åɡ�dest �ˤ� write �᥽�åɤ�ɬ�פǤ���

@param src read �᥽�åɤ���ĥ��֥������ȡ�

@param dest write �᥽�åɤ���ĥ��֥������ȡ�

#@end

--- cp(src, dest, options = {})   -> ()
--- copy(src, dest, options = {}) -> ()

�ե����� src �� dest �˥��ԡ����ޤ���

src �˥ե����뤬��Ĥ���Ϳ����줿��硢
dest ���ǥ��쥯�ȥ�ʤ�dest/src �˥��ԡ����ޤ���
dest ������¸�ߤ�������ǥ��쥯�ȥ�Ǥʤ��Ȥ��Ͼ�񤭤��ޤ���

src �˥ե����뤬ʣ��Ϳ����줿��硢
file1 �� dest/file1 �˥��ԡ���file2 �� dest/file2 �˥��ԡ���
�Ȥ����褦�ˡ��ǥ��쥯�ȥ� dest ����˥ե����� file1��file2 �Ĥ�
Ʊ��̾���ǥ��ԡ����ޤ���dest ���ǥ��쥯�ȥ�Ǥʤ������㳰
[[c:Errno::ENOTDIR]] ��ȯ�����ޤ���

@param src ���ԡ�������Ĥξ���ʸ����Ǥ�����ǽ�Ǥ���
           ��İʾ���ꤹ���������ǻ��ꤷ�ޤ���

@param dest ���ԡ���Υե����뤫�ǥ��쥯�ȥ�Ǥ���

@param options :preserve, :noop, :verbose ������Ǥ��ޤ���
               [[ref:options]]

@raise Errno::ENOTDIR src ��ʣ���Υե����뤫�ġ�dest ���ǥ��쥯�ȥ�Ǥʤ�����ȯ�����ޤ���

��:

  FileUtils.cp 'eval.c', 'eval.c.org'
  FileUtils.cp(['cgi.rb', 'complex.rb', 'date.rb'], '/usr/lib/ruby/1.8')
  FileUtils.cp(%w(cgi.rb complex.rb date.rb), '/usr/lib/ruby/1.8', {:verbose => true})

--- cp_r(src, dest, options = {}) -> ()

src �� dest �˥��ԡ����ޤ���src ���ǥ��쥯�ȥ�Ǥ��ä���Ƶ�Ū��
���ԡ����ޤ������κ� dest ���ǥ��쥯�ȥ�ʤ� dest/src �˥��ԡ����ޤ���

@param src ���ԡ�������Ĥξ���ʸ����Ǥ�����ǽ�Ǥ���
           ��İʾ���ꤹ���������ǻ��ꤷ�ޤ���

@param dest ���ԡ���Υե����뤫�ǥ��쥯�ȥ�Ǥ���

@param options :preserve, :noop, :verbose, :dereference_root, :remove_destination ������Ǥ��ޤ���
               [[ref:options]]

��:

  # installing ruby library "mylib" under the site_ruby
  FileUtils.rm_r(site_ruby + '/mylib', {:force => true})
  FileUtils.cp_r('lib/', site_ruby + '/mylib')
  # other sample
  FileUtils.cp_r(%w(mail.rb field.rb debug/), site_ruby + '/tmail')
  FileUtils.cp_r(Dir.glob('*.rb'), '/home/taro/lib/ruby',
                 {:noop => true, :verbose => true})

--- install(src, dest, options = {})

src �� dest �����Ƥ��㤦�Ȥ����� src �� dest �˥��ԡ����ޤ���

@param src ���ԡ�������Ĥξ���ʸ����Ǥ�����ǽ�Ǥ���
           ��İʾ���ꤹ���������ǻ��ꤷ�ޤ���

@param dest ���ԡ���Υե����뤫�ǥ��쥯�ȥ�Ǥ���

@param options :preserve, :noop, :verbose, :mode ������Ǥ��ޤ���
               [[ref:options]]

��:

  FileUtils.install('ruby', '/usr/local/bin/ruby', {:mode => 0755, :verbose => true})
  FileUtils.install('lib.rb', '/usr/local/lib/ruby/site_ruby', {:verbose => true})

--- ln(src, dest, options = {})   -> ()
--- link(src, dest, options = {}) -> ()

src �ؤΥϡ��ɥ�� dest ��������ޤ���

src ����Ĥξ�硢
dest �����Ǥ�¸�ߤ��ǥ��쥯�ȥ�Ǥ���Ȥ��� dest/src ��������ޤ���
dest �����Ǥ�¸�ߤ��ǥ��쥯�ȥ�Ǥʤ��ʤ���㳰 Errno::ENOTDIR ��ȯ�����ޤ���
������ :force ���ץ�������ꤷ���Ȥ��� dest ���񤭤��ޤ���

src ��ʣ���ξ�硢
src[0] �ؤΥϡ��ɥ�� dest/src[0]��src[1] �ؤ�
�ϡ��ɥ�� dest/src[1] �Ĥ�������ޤ���
dest ���ǥ��쥯�ȥ�Ǥʤ������㳰 Errno::ENOTDIR ��ȯ�����ޤ���

@param src ��󥯸�����Ĥξ���ʸ����Ǥ�����ǽ�Ǥ���
           ��İʾ���ꤹ���������ǻ��ꤷ�ޤ���

@param dest ��󥯺�����Υե����뤫�ǥ��쥯�ȥ�Ǥ���

@param options :force, :noop, :verbose ������Ǥ��ޤ���
               [[ref:options]]

@raise Errno::ENOTDIR dest ���ǥ��쥯�ȥ�Ǥʤ�����ȯ�����ޤ���


��:

  FileUtils.ln('gcc', 'cc', {:verbose => true})
  FileUtils.ln('/usr/bin/emacs21', '/usr/bin/emacs')
  FileUtils.cd('/bin')
  FileUtils.ln(%w(cp mv mkdir), '/usr/bin')

--- ln_s(src, dest, options = {})    -> ()
--- symlink(src, dest, options = {}) -> ()

src �ؤΥ���ܥ�å���� dest ��������ޤ���

src ����Ĥξ�硢
dest �����Ǥ�¸�ߤ��ǥ��쥯�ȥ�Ǥ���Ȥ��� dest/src ��������ޤ���
dest �����Ǥ�¸�ߤ��ǥ��쥯�ȥ�Ǥʤ��ʤ���㳰 Errno::ENOTDIR ��ȯ�����ޤ���
������ :force ���ץ�������ꤷ���Ȥ��� dest ���񤭤��ޤ���

src ��ʣ���ξ�硢
src[0] �ؤΥ���ܥ�å���� dest/src[0]��src[1] �ؤ�
����ܥ�å���� dest/src[1] �Ĥ�������ޤ���
dest ���ǥ��쥯�ȥ�Ǥʤ������㳰 Errno::ENOTDIR ��ȯ�����ޤ���

@param src ��󥯸�����Ĥξ���ʸ����Ǥ�����ǽ�Ǥ���
           ��İʾ���ꤹ���������ǻ��ꤷ�ޤ���

@param dest ��󥯺�����Υե����뤫�ǥ��쥯�ȥ�Ǥ���

@param options :force, :noop, :verbose ������Ǥ��ޤ���
               [[ref:options]]

@raise Errno::ENOTDIR dest ���ǥ��쥯�ȥ�Ǥʤ�����ȯ�����ޤ���


��:

  FileUtils.ln_s('/usr/bin/ruby', '/usr/local/bin/ruby')
  FileUtils.ln_s('verylongsourcefilename.c', 'c', {:force => true})
  FileUtils.ln_s(Dir.glob('bin/*.rb'), '/home/aamine/bin')

--- ln_sf(src, dest, options = {}) -> ()

src �ؤΥ���ܥ�å���� dest ��������ޤ���

ln_s(src, dest, :force => true) ��Ʊ���Ǥ���

@param src ��󥯸�����Ĥξ���ʸ����Ǥ�����ǽ�Ǥ���
           ��İʾ���ꤹ���������ǻ��ꤷ�ޤ���

@param dest ��󥯺�����Υե����뤫�ǥ��쥯�ȥ�Ǥ���

@param options :force, :noop, :verbose ������Ǥ��ޤ���
               [[ref:options]]

@raise Errno::ENOTDIR dest ���ǥ��쥯�ȥ�Ǥʤ�����ȯ�����ޤ���

@see [[m:FileUtils.#ln_s]]

--- mkdir(dir, options = {}) -> ()

�ǥ��쥯�ȥ� dir ��������ޤ���

@param dir ��������ǥ��쥯�ȥꡣ

@param options :mode, :noop, :verbose ������Ǥ��ޤ���
               [[ref:options]]


��:

  FileUtils.mkdir('test')
  FileUtils.mkdir(%w( tmp data ))
  FileUtils.mkdir('notexist', {:noop => true})  # does not create really

--- mkdir_p(list, options = {})  -> String | Array
--- mkpath(list, options = {})   -> String | Array
--- makedirs(list, options = {}) -> String | Array

�ǥ��쥯�ȥ� dir �Ȥ��οƥǥ��쥯�ȥ�����ƺ������ޤ���

�㤨�С�

  FileUtils.mkdir_p('/usr/local/lib/ruby')

�ϰʲ������ǥ��쥯�ȥ�� (�ʤ����) �������ޤ���

  * /usr
  * /usr/local
  * /usr/local/bin
  * /usr/local/bin/ruby

@param list ��������ǥ��쥯�ȥꡣ��Ĥξ���ʸ����Ǥ����Ǥ��ޤ���
            ��İʾ���ꤹ���������ǻ��ꤷ�ޤ���

@param options :mode, :noop, :verbose ������Ǥ��ޤ���
               [[ref:options]]

@return list ���֤��ޤ���

--- mv(src, dest, options = {})   -> ()
--- move(src, dest, options = {}) -> ()

�ե����� src �� dest �˰�ư���ޤ���

src ����Ĥξ�硢
dest �����Ǥ�¸�ߤ��ǥ��쥯�ȥ�Ǥ���Ȥ��� src �� dest/src �ذ�ư���ޤ���
dest �����Ǥ�¸�ߤ��ǥ��쥯�ȥ�Ǥʤ��Ȥ��� src �� dest ���񤭤��ޤ���

src ��ʣ���ξ�硢
src[0] �� dest/src[0]��src[1] �� dest/src[1] �ذ�ư���ޤ���
dest ���ǥ��쥯�ȥ�Ǥʤ������㳰 Errno::ENOTDIR ��ȯ�����ޤ���

@param src ���Υե����롣��Ĥξ���ʸ����Ǥ�����ǽ�Ǥ���
           ��İʾ���ꤹ���������ǻ��ꤷ�ޤ���

@param dest ��ư��Υե����롢�ޤ��ϥǥ��쥯�ȥꡣ

@param options :force, :noop, :verbose, :secure ������Ǥ��ޤ���
               [[ref:options]]

��:

  FileUtils.mv('badname.rb', 'goodname.rb')
  FileUtils.mv('stuff.rb', 'lib/ruby', {:force => true})
  FileUtils.mv(['junk.txt', 'dust.txt'], "#{ENV['HOME']}/.trash")
  FileUtils.mv(Dir.glob('test*.rb'), 'test', {:noop => true, :verbose => true} )

--- pwd   -> String
--- getwd -> String

�ץ����Υ����ȥǥ��쥯�ȥ��ʸ������֤��ޤ���

--- rm(list, options = {})     -> ()
--- remove(list, options = {}) -> ()

list �ǻ��ꤵ�줿�оݤ�õ�ޤ���

@param list ��������оݡ���Ĥξ���ʸ���������ǽ�Ǥ���
            ��İʾ���ꤹ���������ǻ��ꤷ�ޤ���

@param options :force, :noop, :verbose ������Ǥ��ޤ���
               [[ref:options]]

��:

  FileUtils.rm('junk.txt')
  FileUtils.rm(Dir.glob('*~'))
  FileUtils.rm('NotExistFile', {:force => true})    # never raises exception

--- rm_f(list, options = {})        -> ()
--- safe_unlink(list, options = {}) -> ()

FileUtils.rm(list, :force => true) ��Ʊ���Ǥ���

[[ref:options]]

@param list ��������оݡ���Ĥξ���ʸ���������ǽ�Ǥ���
            ��İʾ���ꤹ���������ǻ��ꤷ�ޤ���

@param options :noop, :verbose ������Ǥ��ޤ���
               :force �����åȤ��줿���Ϻ���椹�٤Ƥ� [[c:StandardError]] ��̵�뤷�ޤ���

@see [[m:FileUtils.#rm]]

--- rm_r(list, options = {}) -> ()

�ե�����ޤ��ϥǥ��쥯�ȥ� list ��Ƶ�Ū�˾õ�ޤ���

@param list ��������оݡ���Ĥξ���ʸ���������ǽ�Ǥ���
            ��İʾ���ꤹ���������ǻ��ꤷ�ޤ���

@param options :force, :noop, :verbose, :secure ������Ǥ��ޤ���
               [[ref:options]]

==== ���

���Υ᥽�åɤˤϥ������ȼ�����¸�ߤ��ޤ���
�ܤ����� [[m:FileUtils.#remove_entry_secure]] �ι�򻲾Ȥ��Ƥ���������

��:

  FileUtils.rm_r(Dir.glob('/tmp/*'))

@see [[m:FileUtils.#rm]], [[m:FileUtils.#remove_entry_secure]]

--- rm_rf(list, options = {})  -> ()
--- rmtree(list, options = {}) -> ()

�ե�����ޤ��ϥǥ��쥯�ȥ� list ��Ƶ�Ū�˾õ�ޤ���

rm_r(list, {:force => true}) ��Ʊ���Ǥ���

@param list ��������оݡ���Ĥξ���ʸ���������ǽ�Ǥ���
            ��İʾ���ꤹ���������ǻ��ꤷ�ޤ���

@param options :noop, :verbose, :secure ������Ǥ��ޤ���
               [[ref:options]]

==== ���

���Υ᥽�åɤˤϥ������ȼ�����¸�ߤ��ޤ���
�ܤ����� [[m:FileUtils.#remove_entry_secure]] �ι�򻲾Ȥ��Ƥ���������


@see [[m:FileUtils.#rm]], [[m:FileUtils.#rm_r]], [[m:FileUtils.#remove_entry_secure]]

--- rmdir(dir, options = {}) -> ()

�ǥ��쥯�ȥ� dir �������ޤ���

@param dir �������ǥ��쥯�ȥ����ꤷ�ޤ�����Ĥξ���ʸ����Ǥ�����ǽ�Ǥ���
           ��İʾ���ꤹ���������ǻ��ꤷ�ޤ���

@param options :noop, :verbose ������Ǥ��ޤ���
               [[ref:options]]

@raise Errno::ENOTEMPTY �������ǥ��쥯�ȥ꤬���Ǥʤ�����ȯ�����ޤ���

��:

  FileUtils.rmdir('somedir')
  FileUtils.rmdir(%w(somedir anydir otherdir))
  # does not remove directory really, outputing message.
  FileUtils.rmdir('somedir', {:verbose => true, :noop => true})

#@since 1.8.3
--- remove_entry(path, force = false)
#@todo

�ե����� path �������ޤ���path ���ǥ��쥯�ȥ�ʤ�Ƶ�Ū�˺�����ޤ���

���Υ᥽�åɤˤϥ������ȼ�����¸�ߤ��ޤ���
�ܤ����� [[m:FileUtils.#remove_entry_secure]] �ι�򻲾Ȥ��Ƥ���������

@param path �������ѥ���

@param force ���ΤȤ��Ϻ�����ȯ������ [[c:StandardError]] ��̵�뤷�ޤ���

��:

  FileUtils.remove_entry '/tmp/ruby.tmp.08883'

@see [[m:FileUtils.#remove_entry_secure]]

#@end

#@since 1.8.3
--- remove_entry_secure(path, force = false) -> ()
#@todo

�ե����� path �������ޤ���path ���ǥ��쥯�ȥ�ʤ�Ƶ�Ū�˺�����ޤ���

[[m:FileUtils.#rm_r]] ����� [[m:FileUtils.#remove_entry]] �ˤ�
TOCTTOU (time-of-check to time-of-use)�ȼ�����¸�ߤ��ޤ���
���Υ᥽�åɤϤ�����ɤ�����˿��ߤ���ޤ�����
[[m:FileUtils.#rm_r]] ����� [[m:FileUtils.#remove_entry]] �ϰʲ��ξ�郎
���������Ȥ��ˤϥ������ƥ��ۡ���ˤʤꤨ�ޤ���

  * �ƥǥ��쥯�ȥ꤬���桼������񤭹��߲�ǽ (/tmp ��ޤ�)
  * path �ʲ��Τ����줫�Υǥ��쥯�ȥ꤬���桼������񤭹��߲�ǽ
  * �����ƥब����ܥ�å���󥯤����

�����ȼ������ɤ����ᡢremove_entry_secure �Ϻ������ path �ʲ���
�ǥ��쥯�ȥ�Υ����ʡ��ȥѡ��ߥå������ѹ������嵭�ξ�����򤷤ޤ���
������ remove_entry_secure �Ͽƥǥ��쥯�ȥ꤬�ʲ��ξ������������Ȥ�
���ꤷ�Ƥ��ޤ���

  * UNIX �����ƥप��Ӥ�����ह��Ķ��Ǥϡ�sticky �ӥåȤ�Ω�äƤ��뤳�ȡ�
  * ���桼�����񤭹��߲�ǽ�Ǥ���Τϡ�ľ�ܤοƥǥ��쥯�ȥ�ΤߤǤ��뤳�ȡ�
    �㤨�С�/var/tmp �Υѡ��ߥå���� 1777 �Ǥ���Τ����ꤢ��ޤ��󤬡�
    ���ξ�� / �� /var �����桼������񤭹��߲�ǽ�Ǥ��äƤϤʤ�ޤ���

���ξ�郎��������ʤ���� remove_entry_secure �ϰ����ǤϤ���ޤ���

@param path �������ѥ���

@param force ���ΤȤ��Ϻ�����ȯ������ [[c:StandardError]] ��̵�뤷�ޤ���

#@end

--- remove_file(path, force = false) -> ()

�ե����� path �������ޤ���

@param path �������ե����롣

@param force ���ΤȤ��Ϻ�����ȯ������ [[c:StandardError]] ��̵�뤷�ޤ���

--- remove_dir(path, force = false) -> ()

�ǥ��쥯�ȥ� path �������ޤ���

@param path �������ǥ��쥯�ȥꡣ

@param force ���ΤȤ��Ϻ�����ȯ������ [[c:StandardError]] ��̵�뤷�ޤ���

--- touch(list, options = {}) -> ()

list �ǻ��ꤵ�줿�ե�����κǽ��ѹ����� (mtime) ��
������������ (atime) ���ѹ����ޤ���

list �ǻ��ꤵ�줿�ե����뤬¸�ߤ��ʤ����϶��Υե������������ޤ���

@param list �оݤΥե����롣��Ĥξ���ʸ���������ǽ�Ǥ���
            ��İʾ���ꤹ���������ǻ��ꤷ�ޤ���

@param options :noop �� :verbose ������Ǥ��ޤ���
               [[ref:options]]

��:

  FileUtils.touch('timestamp')
  FileUtils.touch(Dir.glob('*.c'))

--- uptodate?(newer, older_list, options = nil) -> bool

newer ����older_list �˴ޤޤ�뤹�٤ƤΥե������꿷�����Ȥ�����
¸�ߤ��ʤ��ե������̵�¤˸Ť��Ȥߤʤ���ޤ���

@param newer �ե�������Ļ��ꤷ�ޤ���

@param older_list �ե�����̾���������ꤷ�ޤ���

@param options �ɤΤ褦�ʥ��ץ�������ꤹ�뤳�ȤϤǤ��ޤ���

@raise ArgumentError options �˥��ץ�������ꤷ������ȯ�����ޤ���

��:

  FileUtils.uptodate?('hello.o', ['hello.c', 'hello.h']) or system('make')

= module FileUtils::Verbose
include FileUtils

FileUtils ��Ʊ���᥽�åɤ��������Ƥ�������Ʊ��ư��򤷤ޤ�����
���褦�Ȥ��Ƥ��뤳�Ȥ�¹�����ɽ�����ޤ���

= module FileUtils::NoWrite
include FileUtils

FileUtils ��Ʊ���᥽�åɤ��������Ƥ��ޤ�����
�ºݤ˥ե�������ѹ��������ϼ¹Ԥ��ޤ���


= module FileUtils::DryRun
include FileUtils

FileUtils ��Ʊ���᥽�åɤ��������Ƥ��ޤ�����
�ºݤ˥ե�������ѹ��������ϼ¹Ԥ���������ɽ�����ޤ���
