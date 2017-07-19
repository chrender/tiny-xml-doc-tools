

**About tiny-xml-doc-tools v0.1.4**


The tiny-xml-doc-tools are a set of XSLT and script files used by the fizmo modules to provide documentation in various output formats. It invokes xsltproc to perform the actual conversion.

---

**List of document elements**


The following elements can be used in regular XML documentation files:


 - \<document\> – Root element
 - \<section\> — Section container
 - \<ul\>, \<ol\> and \<li\> — Lists and items
 - \<p\> — Text paragraph
 - \<code\> — Code section
 - \<a\> with @href — Hyperlink
 - \<i\> — Italics
 - \<b\> — Bold
 - \<tt\> — Monospaced
 - \<br\> — Linebreak


---

**List of changelog elements**


The following elements can be used for changelogs:


 - \<changelog\> — Root element
 - \<change\> with @version — Version container
 - \<datetime\> with @day-of-week, @month, @day, @hour, @minute, @second, @timezone and @year — denotes parent's change date.
 - \<logentry\> — Describes change, used inside change element.
 - \<a\> with @href — Hyperlink


