; Minimum elements necessary to create an object with (entmakex)

; LWPOLYLINE: lightweight polyline
(entmakex
  (append
    (list
      (cons   0 "LWPOLYLINE")         ; Object type
      (cons 100 "AcDbEntity")
      (cons 100 "AcDbPolyline")
      (cons  70 0)                  ; Open(0)/Closed(1)
      (cons  90 2)                  ; Number of vertices
    )
    (list
      (cons 10 p1)                  ; Vertex 1
      (cons 10 p2)                  ; Vertex 2
;      ...                          ; Vertex ...
;      (cons 10 pn)                 ; Vertex n
    )
  );END append
)

; INSERT
(entmakex
  (list
    (cons  0 "INSERT")
    (cons  2 blockName)           ; Block name
    (cons 10 insertionPoint)      ; Insertion point coordinates
  )
)

; ATTDEF
(entmakex
  (list
    (cons  0 "ATTDEF")  ; Entity type [ename]
    (cons  1 def)       ; Value [str], spaces allowed
    (cons  2 tag)       ; Tag [str], spaces not allowed
    (cons  3 pr)        ; Prompt [str], spaces allowed
    (cons 10 pt)        ; Text first base point [pt]
    (cons 40 h)         ; Text height [real]
    (cons 70 f)         ; Attribute flag [int]: 0=No flags, 1=Invisible, 2=Constant, 4=Verification is Required, 8=Preset (no prompt)
  )
)
