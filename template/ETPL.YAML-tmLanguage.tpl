# ETPL
# author: Firede(firede@firede.us)
# github: https://github.com/ecomfe/sublime-etpl
---
name: ETPL
scopeName: text.html.etpl
fileTypes: [etpl, tpl, text.html, tpl.html]
uuid: f8961911-529d-48e9-8fd2-58c5d733ae68

patterns:
- include: '#comments'
- include: '#variables'
- include: '#commands'
- include: '#html-tags'
- include: text.html.basic

repository:
  commands:
    name: meta.command.etpl
    begin: (#{commandOpen})\s*(\/)?([a-z]*)\s*(:)?
    end: (#{commandClose})
    beginCaptures:
      '1': {name: storage.type.command.begin.etpl}
      '2': {name: keyword.operator.command.close.etpl}
      '3': {name: support.class.etpl entity.name.command.etpl}
      '4': {name: keyword.operator.command.start.etpl}
    endCaptures:
      '1': {name: storage.type.command.end.etpl}
    patterns:
    - include: '#string'
    - include: '#numeric'
    - include: '#variables'
    - include: '#func'
    - include: '#operator'

  operator:
    patterns:
    - name: meta.delimiter.comma.etpl
      match: ','
    - name: keyword.operator.etpl
      match: '!|\$|%|&|\*|\-\-|\-|\+\+|\+|~|===|==|=|!=|!==|<=|>=|<<=|>>=|>>>=|<>|<|>|!|&&|\|\||\?\:|\*=|(?<!\()/=|%=|\+=|\-=|&=|\^=|\.|\b(as)\b'
    - name: meta.brace.square.etpl
      match: '\[|\]'

  func:
    begin: ([a-zA-Z0-9\_]+)(\()
    end: (\))
    beginCaptures:
      '1': {name: entity.name.function.etpl}
      '2': {name: keyword.operator.etpl meta.brace.round.etpl}
    endCaptures:
      '1': {name: keyword.operator.etpl meta.brace.round.etpl}
    patterns:
    - include: '#string'
    - include: '#numeric'
    - include: '#variables'
    - include: '#operator'
    - include: '#parameter-in'

  numeric:
    name: constant.numeric.etpl
    match: \b((0(x|X)[0-9a-fA-F]+)|([0-9]+(\.[0-9]+)?))\b

  comments:
    comment: ETPL comments, like <!-- // comments -->
    name: comment.line.character.etpl
    begin: #{commandOpen}\s*\/\/
    end: #{commandClose}
    patterns:
    - include: '#invalid-comments'
    - name: invalid.reminder.etpl
      match: \b(?i:TODO|FIXME)\b

  variables:
    comment: ETPL Variables, like ${name}, ${ data.name | raw }
    name: variable.other.etpl
    begin: (\$\{)\s*(\*?)\s*
    end: \s*(\})
    beginCaptures:
      '1': {name: storage.type.variable.begin.etpl}
      '2': {name: storage.modifier.raw.etpl}
    endCaptures:
      '1': {name: storage.type.variable.end.etpl}
    patterns:
    - include: '#string'
    - include: '#numeric'
    - include: '#func'
    - include: '#operator'
    - include: '#pipeline'
    - include: '#variable-in'

  variable-in:
    name: entity.other.attribute-name.etpl variable.other.in.etpl
    match: '\b([a-zA-Z0-9_])+\b'

  parameter-in:
    name: variable.parameter.in.etpl
    match: '\b([a-zA-Z0-9_])+\b'

  pipeline:
    match: \s*\|\s*
    name: keyword.control.pipeline.etpl

  string:
    patterns:
    - include: '#string-single-quoted'
    - include: '#string-double-quoted'

  string-single-quoted:
    name: string.quoted.single.etpl
    begin: \'
    end: \'
    beginCaptures:
      '0': {name: punctuation.definition.string.begin.html}
    endCaptures:
      '0': {name: punctuation.definition.string.end.html}
    patterns:
    - include: '#variables'
    - include: '#escaped-single-quote'
    - include: '#comments'
    - include: '#commands'
    - include: '#entities'

  string-double-quoted:
    name: string.quoted.double.etpl
    begin: \"
    end: \"
    beginCaptures:
      '0': {name: punctuation.definition.string.begin.html}
    endCaptures:
      '0': {name: punctuation.definition.string.end.html}
    patterns:
    - include: '#variables'
    - include: '#escaped-double-quote'
    - include: '#comments'
    - include: '#commands'
    - include: '#entities'

  escaped-single-quote:
    name: constant.character.escape.js
    match: \\\'
  escaped-double-quote:
    name: constant.character.escape.js
    match: \\\"

  entities:
    patterns:
    - name: constant.character.entity.html
      match: (&)([a-zA-Z0-9]+|#[0-9]+|#x[0-9a-fA-F]+)(;)
      captures:
        '1': {name: punctuation.definition.entity.html}
        '3': {name: punctuation.definition.entity.html}
    - name: invalid.illegal.bad-ampersand.html
      match: "&"

  html-tags:
    patterns:
    - comment: '<tag></tag>, <x-component></x-component>'
      name: meta.tag.any.html
      begin: (<)([a-zA-Z0-9:-]+)(?=[^>]*></\2>)
      end: (>)(<)(/)(\2)(>)
      beginCaptures:
        '1': {name: punctuation.definition.tag.begin.html}
        '2': {name: entity.name.tag.html}
      endCaptures:
        '1': {name: punctuation.definition.tag.end.html}
        '2': {name: punctuation.definition.tag.begin.html meta.scope.between-tag-pair.html}
        '3': {name: punctuation.definition.tag.begin.html}
        '4': {name: entity.name.tag.html}
        '5': {name: punctuation.definition.tag.end.html}
      patterns:
      - include: '#tag-stuff'
    - comment: '<?xml version="1.0" ?>'
      name: meta.tag.preprocessor.xml.html
      begin: (<\?)(xml)
      end: (\?>)
      captures:
        '1': {name: punctuation.definition.tag.html}
        '2': {name: entity.name.tag.xml.html}
      patterns:
      - include: '#tag-generic-attribute'
      - include: '#string'
    - name: comment.block.html
      begin: <!--
      end: --\s*>
      captures:
        '0': {name: punctuation.definition.comment.html}
      patterns:
      - include: '#invalid-comments'
      # embedded code
      - include: '#variables'
      - include: '#commands'
    - name: meta.tag.sgml.html
      begin: '<!'
      end: '>'
      captures:
        '0': {name: punctuation.definition.tag.html}
      patterns:
      - name: meta.tag.sgml.doctype.html
        begin: (?i:doctype)
        end: (?=>)
        patterns:
        - name: string.quoted.double.doctype.identifiers-and-DTDs.html
          match: \"[^">]*\"
      - name: constant.other.inline-data.html
        begin: \[CDATA\[
        end: ']](?=>)'
        patterns:
        - include: '#variables'
        - include: '#commands'
      - name: invalid.illegal.bad-comments-or-CDATA.html
        match: (\s*)(?!--|>)\S(\s*)
    - name: source.css.embedded.html
      begin: (?:^\s+)?(<)((?i:style))\b(?![^>]*/>)
      end: (</)((?i:style))(>)(?:\s*\n)?
      captures:
        '1': {name: punctuation.definition.tag.begin.html}
        '2': {name: entity.name.tag.style.html}
        '3': {name: punctuation.definition.tag.html}
      patterns:
      - include: '#tag-stuff'
      - begin: (>)
        end: (?=</(?:style))
        beginCaptures:
          '1': {name: punctuation.definition.tag.html}
        patterns:
        - include: '#commands'
        - include: source.css
    - name: source.js.embedded.html
      begin: (?:^\s+)?(<)((?i:script))\b(?![^>]*/>)
      end: (?<=</(script|SCRIPT))(>)(?:\s*\n)?
      beginCaptures:
        '1': {name: punctuation.definition.tag.html}
        '2': {name: entity.name.tag.script.html}
      endCaptures:
        '2': {name: punctuation.definition.tag.html}
      patterns:
      - include: '#tag-stuff'
      - begin: (?<!</(?:script|SCRIPT))(>)
        end: (</)((?i:script))
        captures:
          '1': {name: punctuation.definition.tag.begin.html}
          '2': {name: entity.name.tag.script.html}
        patterns:
        - name: comment.line.double-slash.js
          match: (//).*?((?=>/script)|$\n?)
          captures:
            '1': {name: punctuation.definition.comment.js}
        - name: comment.block.js
          begin: /\*
          end: \*/|(?=</script)
          captures:
            '0': {name: punctuation.definition.comment.js}
        - include: '#commands'
        - include: source.js
    - name: meta.tag.structure.any.html
      begin: (</?)((?i:body|head|html)\b)
      end: (>)
      captures:
        '1': {name: punctuation.definition.tag.html}
        '2': {name: entity.name.tag.structure.any.html}
      endCaptures:
        '1': {name: punctuation.definition.tag.end.html}
      patterns:
      - include: '#tag-stuff'
    - name: meta.tag.block.any.html
      begin: (</?)((?i:address|blockquote|dd|div|dl|dt|fieldset|form|frame|frameset|h1|h2|h3|h4|h5|h6|iframe|noframes|object|ol|p|ul|applet|center|dir|hr|menu|pre)\b)
      end: (>)
      beginCaptures:
        '1': {name: punctuation.definition.tag.begin.html}
        '2': {name: entity.name.tag.block.any.html}
      endCaptures:
        '1': {name: punctuation.definition.tag.end.html}
      patterns:
      - include: '#tag-stuff'
    - name: meta.tag.inline.any.html
      begin: (</?)((?i:a|abbr|acronym|area|b|base|basefont|bdo|big|br|button|caption|cite|code|col|colgroup|del|dfn|em|font|head|html|i|img|input|ins|isindex|kbd|label|legend|li|link|map|meta|noscript|optgroup|option|param|q|s|samp|script|select|small|span|strike|strong|style|sub|sup|table|tbody|td|textarea|tfoot|th|thead|title|tr|tt|u|var)\b)
      end: '((?: ?/)?>)'
      beginCaptures:
        '1': {name: punctuation.definition.tag.begin.html}
        '2': {name: entity.name.tag.inline.any.html}
      endCaptures:
        '1': {name: punctuation.definition.tag.end.html}
      patterns:
      - include: '#tag-stuff'
    - name: meta.tag.other.html
      begin: (</?)([a-zA-Z0-9:]+)
      end: (>)
      beginCaptures:
        '1': {name: punctuation.definition.tag.begin.html}
        '2': {name: entity.name.tag.other.html}
      endCaptures:
        '1': {name: punctuation.definition.tag.end.html}
      patterns:
      - include: '#tag-stuff'
    - include: '#entities'
    - name: invalid.illegal.incomplete.html
      match: <>
    - name: invalid.illegal.bad-angle-bracket.html
      match: <


  tag-stuff:
    patterns:
    # and more
    - include: '#tag-generic-attribute'
    - include: '#tag-id-attribute'
    - include: '#string'
    - include: '#comments'
    - include: '#variables'
    - include: '#commands'

  tag-generic-attribute:
    name: entity.other.attribute-name.html
    match: \b([a-zA-Z\-:]+)

  tag-id-attribute:
    name: meta.attribute-with-value.id.html
    begin: \b(id)\b\s*(=)
    end: (?<='|")
    captures:
      '1': {name: entity.other.attribute-name.id.html}
      '2': {name: punctuation.separator.key-value.html}
    patterns:
    - name: string.quoted.double.html
      contentName: meta.toc-list.id.html
      begin: \"
      end: \"
      beginCaptures:
        '0': {name: punctuation.definition.string.begin.html}
      endCaptures:
        '0': {name: punctuation.definition.string.end.html}
      patterns:
      - include: '#variables'
      - include: '#commands'
      - include: '#entities'
    - name: string.quoted.single.html
      contentName: meta.toc-list.id.html
      begin: \'
      end: \'
      beginCaptures:
        '0': {name: punctuation.definition.string.begin.html}
      endCaptures:
        '0': {name: punctuation.definition.string.end.html}
      patterns:
      - include: '#variables'
      - include: '#commands'
      - include: '#entities'

  invalid-comments:
    name: invalid.illegal.bad-comments-or-CDATA.html
    match: --

...
