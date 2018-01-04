meta:
  id: wxapkg
  file-extension: wxapkg
  endian: be
seq:
  - id: header
    type: header
  - id: files
    type: file
    repeat: expr
    repeat-expr: header.file_count
types:
  header:
    seq:
      - id: first_mark
        contents: [0xbe]
      - id: edition
        type: u4
      - id: index_info_length
        type: u4
      - id: body_info_length
        type: u4
      - id: last_mark
        contents: [0xed]
      - id: file_count
        type: u4
  file:
    seq:
      - id: name_length
        type: u4
      - id: name
        size: name_length
        type: str
        encoding: ASCII
      - id: file_offset
        type: u4
      - id: file_size
        type: u4
    instances:
      body:
        io: _root._io
        pos: file_offset
        size: file_size
