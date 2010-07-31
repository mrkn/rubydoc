#@since 1.9.1
HTML ���������뤿��Υ᥽�åɤ��󶡤���⥸�塼�����������饤�֥��Ǥ���

�͡��� DTD ���б����Ƥ��ޤ���
#@end
= module CGI::TagMaker
#@#nodoc

== Instance Methods

--- nn_element_def(element)
#@todo

--- nOE_element_def(element, append = nil)
#@todo

--- nO_element_def(element)
#@todo

= module CGI::HtmlExtension

HTML ���������뤿��Υ᥽�åɤ��󶡤���⥸�塼��Ǥ���

��:
   cgi.a("http://www.example.com") { "Example" }
     # => "<A HREF=\"http://www.example.com\">Example</A>"

== Instance Methods

--- a(href = "") -> String
--- a(href = ""){ ... } -> String

a ���Ǥ��������ޤ���

�֥�å���Ϳ����ȡ��֥�å���ɾ��������̤����Ƥˤʤ�ޤ���

@param href ʸ�������ꤷ�ޤ���°����ϥå���ǻ��ꤹ�뤳�Ȥ�Ǥ��ޤ���
       
��:
  a("http://www.example.com") { "Example" }
    # => "<A HREF=\"http://www.example.com\">Example</A>"

  a("HREF" => "http://www.example.com", "TARGET" => "_top") { "Example" }
    # => "<A HREF=\"http://www.example.com\" TARGET=\"_top\">Example</A>"

--- base(href = "") -> String

base ���Ǥ��������ޤ���

@param href ʸ�������ꤷ�ޤ���°����ϥå���ǻ��ꤹ�뤳�Ȥ�Ǥ��ޤ���

��:
  base("http://www.example.com/cgi")
    # => "<BASE HREF=\"http://www.example.com/cgi\">"

--- blockquote(cite = nil) -> String
--- blockquote(cite = nil){ ... } -> String

blockquote ���Ǥ��������ޤ���

�֥�å���Ϳ����ȡ��֥�å���ɾ��������̤����Ƥˤʤ�ޤ���

@param cite ���Ѹ�����ꤷ�ޤ���°����ϥå���ǻ��ꤹ�뤳�Ȥ�Ǥ��ޤ���
       
��:
  blockquote("http://www.example.com/quotes/foo.html") { "Foo!" }
    #=> "<BLOCKQUOTE CITE=\"http://www.example.com/quotes/foo.html\">Foo!</BLOCKQUOTE>

--- caption(align = nil) -> String
--- caption(align = nil){ ... } -> String

caption ���Ǥ��������ޤ���

�֥�å���Ϳ����ȡ��֥�å���ɾ��������̤����Ƥˤʤ�ޤ���

@param align ���֤�ʸ����ǻ��ꤷ�ޤ���(top, bottom, left right �������ǽ�Ǥ�)
             °����ϥå���ǻ��ꤹ�뤳�Ȥ�Ǥ��ޤ���
       
��:
  caption("left") { "Capital Cities" }
    # => <CAPTION ALIGN=\"left\">Capital Cities</CAPTION>

--- checkbox(name = "", value = nil, checked = nil) -> String

�����פ� checkbox �Ǥ��� input ���Ǥ��������ޤ���

@param name name °�����ͤ���ꤷ�ޤ���

@param value value °�����ͤ���ꤷ�ޤ���

@param checked checked °�����ͤ���ꤷ�ޤ���

��:
  checkbox("name", "value", true)
  # => "<INPUT CHECKED NAME=\"name\" TYPE=\"checkbox\" VALUE=\"value\">"

--- checkbox(attributes) -> String

�����פ� checkbox �Ǥ��� input ���Ǥ��������ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���

��:
  checkbox("name" => "name", "value" => "value", "checked" => true)
  # => "<INPUT checked name=\"name\" TYPE=\"checkbox\" value=\"value\">"

--- checkbox_group(name = "", *values) -> String

�����פ� checkbox �Ǥ��� input ���ǤΥ��롼�פ��������ޤ���

��������� input ���Ǥ� name °���Ϥ��٤�Ʊ���ˤʤꡢ
���줾��� input ���Ǥθ��ˤϥ�٥뤬³���ޤ���

@param name name °�����ͤ���ꤷ�ޤ���

@param values value °���Υꥹ�Ȥ���ꤷ�ޤ���
              ���줾��ΰ�������ñ���ʸ����ξ�硢value °�����ͤȥ�٥��Ʊ����Τ����Ѥ���ޤ���
              ���줾��ΰ������������Ǥޤ��ϻ����Ǥ�����ξ�硢�ǽ����Ǥ� true �Ǥ���С�
              checked °���򥻥åȤ��ޤ�����Ƭ�����Ǥ� value °�����ͤˤʤ�ޤ���

��:
  checkbox_group("name", "foo", "bar", "baz")
    # <INPUT TYPE="checkbox" NAME="name" VALUE="foo">foo
    # <INPUT TYPE="checkbox" NAME="name" VALUE="bar">bar
    # <INPUT TYPE="checkbox" NAME="name" VALUE="baz">baz

  checkbox_group("name", ["foo"], ["bar", true], "baz")
    # <INPUT TYPE="checkbox" NAME="name" VALUE="foo">foo
    # <INPUT TYPE="checkbox" CHECKED NAME="name" VALUE="bar">bar
    # <INPUT TYPE="checkbox" NAME="name" VALUE="baz">baz

  checkbox_group("name", ["1", "Foo"], ["2", "Bar", true], "Baz")
    # <INPUT TYPE="checkbox" NAME="name" VALUE="1">Foo
    # <INPUT TYPE="checkbox" SELECTED NAME="name" VALUE="2">Bar
    # <INPUT TYPE="checkbox" NAME="name" VALUE="Baz">Baz

--- checkbox_group(attributes) -> String

�����פ� checkbox �Ǥ��� input ���ǤΥ��롼�פ��������ޤ���

��������� input ���Ǥ� name °���Ϥ��٤�Ʊ���ˤʤꡢ
���줾��� input ���Ǥθ��ˤϥ�٥뤬³���ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���

��:
  checkbox_group({ "NAME" => "name",
                   "VALUES" => ["foo", "bar", "baz"] })

  checkbox_group({ "NAME" => "name",
                   "VALUES" => [["foo"], ["bar", true], "baz"] })

  checkbox_group({ "NAME" => "name",
                   "VALUES" => [["1", "Foo"], ["2", "Bar", true], "Baz"] })

--- file_field(name = "", size = 20, maxlength = nil) -> String

�����פ� file �Ǥ��� input ���Ǥ��������ޤ���

@param name name °�����ͤ���ꤷ�ޤ���

@param size size °�����ͤ���ꤷ�ޤ���

@param maxlength maxlength °�����ͤ���ꤷ�ޤ���

��:
   file_field("name")
     # <INPUT TYPE="file" NAME="name" SIZE="20">

   file_field("name", 40)
     # <INPUT TYPE="file" NAME="name" SIZE="40">

   file_field("name", 40, 100)
     # <INPUT TYPE="file" NAME="name" SIZE="40" MAXLENGTH="100">

--- file_field(name = "", size = 20, maxlength = nil) -> String

�����פ� file �Ǥ��� input ���Ǥ��������ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���

��:
   file_field({ "NAME" => "name", "SIZE" => 40 })
     # <INPUT TYPE="file" NAME="name" SIZE="40">


--- form(method = "post", action = nil, enctype = "application/x-www-form-urlencoded") -> String
--- form(method = "post", action = nil, enctype = "application/x-www-form-urlencoded"){ ... } -> String

form ���Ǥ��������ޤ���
�֥�å���Ϳ����ȡ��֥�å���ɾ��������̤����Ƥˤʤ�ޤ���

@param method method °�����ͤȤ��� "get" �� "post" ����ꤷ�ޤ���

@param action action °�����ͤ���ꤷ�ޤ����ǥե���Ȥϸ��ߤ� CGI ������ץ�̾�Ǥ���

@param enctype enctype °�����ͤ���ꤷ�ޤ����ǥե���Ȥ� "application/x-www-form-urlencoded" �Ǥ���

��:
  form{ "string" }
    # <FORM METHOD="post" ENCTYPE="application/x-www-form-urlencoded">string</FORM>

  form("get"){ "string" }
    # <FORM METHOD="get" ENCTYPE="application/x-www-form-urlencoded">string</FORM>

  form("get", "url"){ "string" }
    # <FORM METHOD="get" ACTION="url" ENCTYPE="application/x-www-form-urlencoded">string</FORM>


--- form(attributes) -> String
--- form(attributes){ ... } -> String

form ���Ǥ��������ޤ���
�֥�å���Ϳ����ȡ��֥�å���ɾ��������̤����Ƥˤʤ�ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���

��:
  form({"METHOD" => "post", ENCTYPE => "enctype"}){ "string" }
    # <FORM METHOD="post" ENCTYPE="enctype">string</FORM>

@see [[m:CGI::HtmlExtension#multipart_form]]

--- hidden(name = "", value = nil) -> String
�����פ� hidden �Ǥ��� input ���Ǥ��������ޤ���

@param name name °�����ͤ���ꤷ�ޤ���

@param value value °�����ͤ���ꤷ�ޤ���

��:
  hidden("name")
    # <INPUT TYPE="hidden" NAME="name">

  hidden("name", "value")
    # <INPUT TYPE="hidden" NAME="name" VALUE="value">

--- hidden(attributes) -> String
�����פ� hidden �Ǥ��� input ���Ǥ��������ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���

��:
  hidden({ "NAME" => "name", "VALUE" => "reset", "ID" => "foo" })
    # <INPUT TYPE="hidden" NAME="name" VALUE="value" ID="foo">

--- html(attributes = {}) -> String
--- html(attributes = {}){ ... } -> String
�ȥåץ�٥�� html ���Ǥ��������ޤ���
�֥�å���Ϳ����ȡ��֥�å���ɾ��������̤����Ƥˤʤ�ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���
                  ����°���� "PRETTY" ��ʸ�����Ϳ����Ȥ���ʸ����ǥ���ǥ�Ȥ��� HTML ���������ޤ���
                  ����°���� "DOCTYPE" �ˤ� DOCTYPE ����Ȥ��ƻ��Ѥ���ʸ�����Ϳ���뤳�Ȥ��Ǥ��ޤ���

��:

  html{ "string" }
    # <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN"><HTML>string</HTML>

  html({ "LANG" => "ja" }){ "string" }
    # <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN"><HTML LANG="ja">string</HTML>

  html({ "DOCTYPE" => false }){ "string" }
    # <HTML>string</HTML>

  html({ "DOCTYPE" => '<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">' }){ "string" }
    # <!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN"><HTML>string</HTML>

  html({ "PRETTY" => "  " }){ "<BODY></BODY>" }
    # <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
    # <HTML>
    #   <BODY>
    #   </BODY>
    # </HTML>

  html({ "PRETTY" => "\t" }){ "<BODY></BODY>" }
    # <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
    # <HTML>
    #         <BODY>
    #         </BODY>
    # </HTML>

  html("PRETTY"){ "<BODY></BODY>" }
    # = html({ "PRETTY" => "  " }){ "<BODY></BODY>" }

  html(if $VERBOSE then "PRETTY" end){ "HTML string" }

--- image_button(src = "", name = nil, alt = nil) -> String
�����פ� image �� input ���Ǥ��������ޤ���

@param src src °�����ͤ���ꤷ�ޤ���

@param name name °�����ͤ���ꤷ�ޤ���

@param alt alt °�����ͤ���ꤷ�ޤ���

��:
  image_button("url")
    # <INPUT TYPE="image" SRC="url">

  image_button("url", "name", "string")
    # <INPUT TYPE="image" SRC="url" NAME="name" ALT="string">

--- image_button(attributes) -> String
�����פ� image �� input ���Ǥ��������ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���

��:
  image_button({ "SRC" => "url", "ALT" => "string" })
    # <INPUT TYPE="image" SRC="url" ALT="string">

--- img(src = "", alt = "", width = nil, height = nil) -> String
img ���Ǥ��������ޤ���

@param src src °�����ͤ���ꤷ�ޤ���

@param alt alt °�����ͤ���ꤷ�ޤ���

@param width width °�����ͤ���ꤷ�ޤ���

@param height height °�����ͤ���ꤷ�ޤ���

��:
  img("src", "alt", 100, 50)
    # <IMG SRC="src" ALT="alt" WIDTH="100" HEIGHT="50">

--- img(attributes) -> String
img ���Ǥ��������ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���

��:
  img({ "SRC" => "src", "ALT" => "alt", "WIDTH" => 100, "HEIGHT" => 50 })
    # <IMG SRC="src" ALT="alt" WIDTH="100" HEIGHT="50">

--- multipart_form(action = nil, enctype = "multipart/form-data") -> String
--- multipart_form(action = nil, enctype = "multipart/form-data"){ ... } -> String

enctype °���� "multipart/form-data" �򥻥åȤ��� form ���Ǥ��������ޤ���
�֥�å���Ϳ����ȡ��֥�å���ɾ��������̤����Ƥˤʤ�ޤ���

@param action action °�����ͤ���ꤷ�ޤ���

@param enctype enctype °�����ͤ���ꤷ�ޤ���

��:
  multipart_form{ "string" }
    # <FORM METHOD="post" ENCTYPE="multipart/form-data">string</FORM>

--- multipart_form(attributes) -> String
--- multipart_form(attributes){ ... } -> String

enctype °���� "multipart/form-data" �򥻥åȤ��� form ���Ǥ��������ޤ���
�֥�å���Ϳ����ȡ��֥�å���ɾ��������̤����Ƥˤʤ�ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���

��:
  multipart_form("url"){ "string" }
    # <FORM METHOD="post" ACTION="url" ENCTYPE="multipart/form-data">string</FORM>

--- password_field(name = "", value = nil, size = 40, maxlength = nil) -> String
�����פ� password �Ǥ��� input ���Ǥ��������ޤ���

@param name name °�����ͤ���ꤷ�ޤ���

@param value °�����ͤ���ꤷ�ޤ���

@param size size °�����ͤ���ꤷ�ޤ���

@param maxlength maxlength °�����ͤ���ꤷ�ޤ���

��:
  password_field("name")
    # <INPUT TYPE="password" NAME="name" SIZE="40">

  password_field("name", "value")
    # <INPUT TYPE="password" NAME="name" VALUE="value" SIZE="40">

  password_field("password", "value", 80, 200)
    # <INPUT TYPE="password" NAME="name" VALUE="value" SIZE="80" MAXLENGTH="200">

--- password_field(name = "", value = nil, size = 40, maxlength = nil) -> String
�����פ� password �Ǥ��� input ���Ǥ��������ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���

��:
  password_field({ "NAME" => "name", "VALUE" => "value" })
    # <INPUT TYPE="password" NAME="name" VALUE="value">

--- popup_menu(name = "", *values) -> String
--- scrolling_list(name = "", *values) -> String

select ���Ǥ��������ޤ���

@param name name °�����ͤ���ꤷ�ޤ���

@param values option ���Ǥ��������뤿��ξ�����İʾ���ꤷ�ޤ���
              ���줾�졢ʸ���󡢰����ǡ������ǡ������Ǥ��������ꤹ�뤳�Ȥ��Ǥ��ޤ���
              ʸ���󤫰����Ǥ�����Ǥ�����ϡ�value °�����ͤ� option ���Ǥ����Ƥˤʤ�ޤ���
              �����Ǥ�����Ǥ�����ϡ���� value °�����͡�option ���Ǥ����ơ����� option ���Ǥ�
              ������֤��ɤ�����ɽ�������ͤȤʤ�ޤ���
       
        �㡧
        popup_menu("name", "foo", "bar", "baz")
          # <SELECT NAME="name">
          #   <OPTION VALUE="foo">foo</OPTION>
          #   <OPTION VALUE="bar">bar</OPTION>
          #   <OPTION VALUE="baz">baz</OPTION>
          # </SELECT>

        popup_menu("name", ["foo"], ["bar", true], "baz")
          # <SELECT NAME="name">
          #   <OPTION VALUE="foo">foo</OPTION>
          #   <OPTION VALUE="bar" SELECTED>bar</OPTION>
          #   <OPTION VALUE="baz">baz</OPTION>
          # </SELECT>

        popup_menu("name", ["1", "Foo"], ["2", "Bar", true], "Baz")
          # <SELECT NAME="name">
          #   <OPTION VALUE="1">Foo</OPTION>
          #   <OPTION SELECTED VALUE="2">Bar</OPTION>
          #   <OPTION VALUE="Baz">Baz</OPTION>
          # </SELECT>

--- popup_menu(attributes) -> String
--- scrolling_list(attributes) -> String

select ���Ǥ��������ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���

��:
        popup_menu({"NAME" => "name", "SIZE" => 2, "MULTIPLE" => true,
                    "VALUES" => [["1", "Foo"], ["2", "Bar", true], "Baz"] })
          # <SELECT NAME="name" MULTIPLE SIZE="2">
          #   <OPTION VALUE="1">Foo</OPTION>
          #   <OPTION SELECTED VALUE="2">Bar</OPTION>
          #   <OPTION VALUE="Baz">Baz</OPTION>
          # </SELECT>

--- radio_button(name = "", value = nil, checked = nil) -> String

�����פ� radio �Ǥ��� input ���Ǥ��������ޤ���

@param name name °�����ͤ���ꤷ�ޤ���

@param value value °�����ͤ���ꤷ�ޤ���

@param checked ���ʤ�� checked °�������ꤷ�ޤ���

��:
  radio_button("name", "value")
    # <INPUT TYPE="radio" NAME="name" VALUE="value">
 
  radio_button("name", "value", true)
    # <INPUT TYPE="radio" NAME="name" VALUE="value" CHECKED>

--- radio_button(attributes) -> String

�����פ� radio �Ǥ��� input ���Ǥ��������ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���

��:
  radio_button({ "NAME" => "name", "VALUE" => "value", "ID" => "foo" })
    # <INPUT TYPE="radio" NAME="name" VALUE="value" ID="foo">

--- radio_group(name = "", *values) -> String
�����פ� radio �Ǥ��� input ���ǤΥꥹ�Ȥ��������ޤ���

��������� input ���Ǥ� name °���Ϥ��٤�Ʊ���ˤʤꡢ
���줾��� input ���Ǥθ��ˤϥ�٥뤬³���ޤ���

@param name name °�����ͤ���ꤷ�ޤ���

@param values value °���Υꥹ�Ȥ���ꤷ�ޤ���
              ���줾��ΰ�������ñ���ʸ����ξ�硢value °�����ͤȥ�٥��Ʊ����Τ����Ѥ���ޤ���
              ���줾��ΰ������������Ǥޤ��ϻ����Ǥ�����ξ�硢�ǽ����Ǥ� true �Ǥ���С�
              checked °���򥻥åȤ��ޤ�����Ƭ�����Ǥ� value °�����ͤˤʤ�ޤ���

��:
  radio_group("name", "foo", "bar", "baz")
    # <INPUT TYPE="radio" NAME="name" VALUE="foo">foo
    # <INPUT TYPE="radio" NAME="name" VALUE="bar">bar
    # <INPUT TYPE="radio" NAME="name" VALUE="baz">baz
  
  radio_group("name", ["foo&quot;], ["bar", true], "baz")
    # <INPUT TYPE="radio" NAME="name" VALUE="foo">foo
    # <INPUT TYPE=&quot;radio" CHECKED NAME="name" VALUE="bar">bar
    # <INPUT TYPE="radio" NAME="name" VALUE="baz">baz
  
  radio_group("name", ["1", "Foo"], ["2", "Bar", true], "Baz")
    # <INPUT TYPE="radio" NAME="name" VALUE="1">Foo
    # <INPUT TYPE="radio" CHECKED NAME="name" VALUE="2">Bar
    # <INPUT TYPE="radio" NAME="name" VALUE="Baz">Baz
  
--- radio_group(name = "", *values) -> String
�����פ� radio �Ǥ��� input ���ǤΥꥹ�Ȥ��������ޤ���

��������� input ���Ǥ� name °���Ϥ��٤�Ʊ���ˤʤꡢ
���줾��� input ���Ǥθ��ˤϥ�٥뤬³���ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���

��:
  radio_group({ "NAME" => "name",
                "VALUES" => ["foo", "bar", "baz"] })
  
  radio_group({ "NAME" => "name",
                "VALUES" => [["foo"], ["bar", true], "baz"] })
  
  radio_group({ "NAME" => "name",
                "VALUES" => [["1", "Foo"], ["2", "Bar", true], "Baz"] })

--- reset(value = nil, name = nil) -> String
�����פ� reset �Ǥ��� input ���Ǥ��������ޤ���

@param value value °�����ͤ���ꤷ�ޤ���

@param name name °�����ͤ���ꤷ�ޤ���

��:
  reset
    # <INPUT TYPE="reset">
  
  reset("reset")
    # <INPUT TYPE="reset" VALUE="reset">
  
--- reset(attributes) -> String
�����פ� reset �Ǥ��� input ���Ǥ��������ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���

  reset({ "VALUE" => "reset", "ID" => "foo" })
    # <INPUT TYPE="reset" VALUE="reset" ID="foo">

--- submit(value = nil, name = nil) -> String
�����פ� submit �Ǥ��� input ���Ǥ��������ޤ���

@param value value °�����ͤ���ꤷ�ޤ���

@param name name °�����ͤ���ꤷ�ޤ���

��:
  submit
    # <INPUT TYPE="submit">
  
  submit("ok")
    # <INPUT TYPE="submit" VALUE="ok">
  
  submit("ok", "button1")
    # <INPUT TYPE="submit" VALUE="ok" NAME="button1">
  
--- submit(attributes) -> String
�����פ� submit �Ǥ��� input ���Ǥ��������ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���

��:
  submit({ "VALUE" => "ok", "NAME" => "button1", "ID" => "foo" })
    # <INPUT TYPE="submit" VALUE="ok" NAME="button1" ID="foo">

--- text_field(name = "", value = nil, size = 40, maxlength = nil) -> String
�����פ� text �Ǥ��� input ���Ǥ��������ޤ���

@param name name °�����ͤ���ꤷ�ޤ���

@param value °�����ͤ���ꤷ�ޤ���

@param size size °�����ͤ���ꤷ�ޤ���

@param maxlength maxlength °�����ͤ���ꤷ�ޤ���

��:
  text_field("name")
    # <INPUT TYPE="text" NAME="name" SIZE="40">
  
  text_field("name", "value")
    # <INPUT TYPE="text" NAME="name" VALUE="value" SIZE="40">
  
  text_field("name", "value", 80)
    # <INPUT TYPE="text" NAME="name" VALUE="value" SIZE="80">
  
  text_field("name", "value", 80, 200)
    # <INPUT TYPE="text" NAME="name" VALUE="value" SIZE="80" MAXLENGTH="200">
  
--- text_field(attributes) -> String
�����פ� text �Ǥ��� input ���Ǥ��������ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���

  text_field({ "NAME" => "name", "VALUE" => "value" })
    # <INPUT TYPE="text" NAME="name" VALUE="value">

--- textarea(name = "", cols = 70, rows = 10) -> String
textarea ���Ǥ��������ޤ���

@param name name °�����ͤ���ꤷ�ޤ���

@param cols cols °�����ͤ���ꤷ�ޤ���

@param rows rows °�����ͤ���ꤷ�ޤ���

��:
   textarea("name")
     # = textarea({ "NAME" => "name", "COLS" => 70, "ROWS" => 10 })

--- textarea(attributes) -> String
textarea ���Ǥ��������ޤ���

@param attributes °����ϥå���ǻ��ꤷ�ޤ���

��:
   textarea("name", 40, 5)
     # = textarea({ "NAME" => "name", "COLS" => 40, "ROWS" => 5 })

= module CGI::Html3
#@# nodoc

== Instance Methods

--- doctype
#@todo

--- element_init
#@todo

= module CGI::Html4
#@# nodoc

== Instance Methods

--- doctype
#@todo

--- element_init
#@todo

= module CGI::Html4Fr
#@# nodoc

== Instance Methods

--- doctype
#@todo

--- element_init
#@todo

= module CGI::Html4Tr
#@# nodoc

== Instance Methods

--- doctype
#@todo

--- element_init
#@todo
