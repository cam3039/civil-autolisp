; UNDEFINE
;(command
;  "_.undefine" "intersect"
;  "_.undefine" "interfere"
;  "_.undefine" "redraw"
;  "_.undefine" "redrawall"
;  "_.undefine" "fill"
;  "_.undefine" "filletedge"
;  "_.undefine" "surffillet"
;  "_.undefine" "donut"
;  "_.undefine" "donutid"
;  "_.undefine" "donutod"
;  "_.undefine" "targetpoint"
;)
(defun c:iso() (command "_.isolateobjects")(princ))
(defun c:iso() (command "_.isolateobjects")(princ))
(defun c:uiso() (command "_.unisolateobjects")(princ))
(defun c:c() (command "_.copy" pause "" "_non" (cadr (grread 't)) "_non" pause) )
(defun c:cc() (command "_.copy") )
(defun c:m() (command "_.move" pause "" "_non" (cadr (grread 't)) "_non" pause) )
(defun c:mo() (command "_.move"))
(defun c:mm() (command "_.move"))
(defun c:p00()
  (command
    "_.pasteblock" "0,0"
    "_.scale" "L" "" "0,0" "1000"
    "_.explode" "L" ""
    "_.zoom" "O" "L" ""
  )
  (princ)
)
(defun c:ci()	(command "_.circle")(princ))
(defun c:n() (command "_.NCOPY" pause "" "" ""))
(defun c:xu() (command "_-xref" "u" "*")(alert "Xref Unload finished!")(princ)) ;Unload all Xrefs
(defun c:xr() (command "_-xref" "r" "*")(alert "Xref Reload finished!")(princ)) ;Reload all Xrefs
(defun c:t () (command "_.textedit" "M" "S" pause))
(defun c:tt () (command "_.textedit" "M" "M" pause))
(defun c:pp()(command "_.publish"))
(defun c:las() (command "_.layerstate")(princ))
(defun c:zz ( / ss )
  ; Change selected entities' color to blue
  (princ "\nMarking in blue:")
  (if (setq ss (ssget))
    (foreach a (ssnamex ss)
      (if (= 'ename (type (cadr a)))
        (vlax-put-property (vlax-ename->vla-object (cadr a)) 'Color 5)
      );END if
    );END foreach
  );END if

  ; v0.0 - 2017.03.13 - First issue
  ; Author: David Torralba
  ; Last revision: 2017.03.13
)
(defun c:o ( / x ) (if (setq x (getint (strcat "\nObject Snap Mode <" (itoa (getvar "osmode")) ">: "))) (setvar "osmode" x) (princ "*Cancel*"))(princ))
(defun c:os () (c:o))
(defun c:rr () (princ "\nMultiple rotate:") (c:RTM))
(defun c:rrr() (princ "\nRegenerating...") (command "_.regenall") (princ " done.")(princ))
(defun c:nt( / oldtextstyle olderror pt)
  (save_environment (list "textstyle" "cmdecho"))
  (setvar "cmdecho" 0)
  (setq
    pt (getpoint "\nSelect text insertion point: ")
  )

  (command
    "-text" "S"
    (if (tblsearch "STYLE" "ARIAL") "ARIAL" "Standard")                   ; Text style management
    "J" "MC" pt 3
    (* (if (= 1 (getvar "angdir")) 1 -1) (getvar "angbase") (/ 180 pi) )  ; Text rotation management
    (getstring t "\nEnter text: ")
    "scale" "L" "" pt pause
  )

  ; RESTORE SETTINGS
  (restore_environment)

  (princ)

  ; V0.1 - 2017.05.12 - Error management implemented
  ; v0.0 - 2016.??.?? - First issue
  ; Author: David Torralba
  ; Last revision: 2017.05.12
)
(defun c:ha ( )
  ; automatic HAtching
  ; This function selects the polylines within the selection set,
  ; closes them and creates an individual associative hatch for each polyline
  ;
  (vl-load-com)
  (foreach a (ssnamex (ssget '((-4 . "<OR") (0 . "LWPOLYLINE") (0 . "POLYLINE") (-4 . "OR>"))) )
    (if (= 'ename (type (cadr a)))
      (DT:ha (cadr a) "ANSI31" "0.1")
    );END if
  );END foreach

  ; v0.2 - 2016.12.23 - DT:ha implemented
	; v0.1 - 2016.06.15 - Force hatch to be in current layer.
  ; v0.0 - 2016.03.16 - First issue
  ; Author: David Torralba
  ; Last revision: 2016.12.23
)
(defun c:has()
	(command "-hatch" "S" (ssget) "" "")
	(princ)

  ; v0.0 - 2017.??.?? - First issue
  ; Author: David Torralba
  ; Last revision: 2017.05.12
)
(defun c:BY ( / ss)
  ; Set by layer
  (setq ss (ssget))
  (command "._SetByLayer" ss "" "y" "y")

  ; v0.0 - 2016.03.18 - First issue
  ; Author: David Torralba
  ; Last revision: 2016.03.18
)
(defun c:BYC ()
  (princ "\nSelet objects to set ByLayer:")
  (foreach a (ssnamex (ssget))
    (if (= 'ename (type (cadr a)))
      (vlax-put-property (vlax-ename->vla-object (cadr a)) 'Color 256)
    );END if1
  );END foreach
  (princ)

  ; v0.2 - 2017.03.14 - Xref' filter removed, pointless
  ; v0.1 - 2016.11.14 - Xref's filtered and excluded to speed up command
  ; v0.0 - 2016.11.11 - First issue
  ; Author: David Torralba
  ; Last revision: 2017.03.14
)
(defun c:c0()
  ; Shortcut for copybase with origin (0 0 0) as reference coordinates
  (command "copybase" (list 0 0 0) (ssget) "")(princ)
)
(defun c:p0()
  ; Shortcut to PASTECLIP at origin (0 0 0)
  (command "_pasteclip" "0,0")(princ)
)
(defun c:au ()
  ; Fast audit and save
  (command "audit" "Yes")
  (command "_qsave")
	(princ "\nDrawing audited and saved.")
  (alert "Drawing audited and saved.")
  (princ)

  ; v0.0 - 2016.03.18 - First issue
  ; Author: David Torralba
  ; Last revision: 2016.03.18
)
(defun c:s()
  ; Save and prompt message
  (command "_qsave")
  (princ "\nDrawing saved.")
  (alert "Drawing saved.")
  (princ)
  ; v0.0 - 2016.11.17 - First issue
  ; Author: David Torralba
  ; Last revision: 2016.11.17
)
(defun c:cl ( / ss i ent ent_name VL_ent_name)
  ; Close selected polylines
  (if (setq ss (ssget '((-4 . "<OR")(0 . "LWPOLYLINE")(0 . "POLYLINE")(-4 . "OR>"))))
    (foreach a (ssnamex ss)
      (if (= 'ename (type (cadr a)))
        (if (= :vlax-false (vla-get-closed (vlax-ename->vla-object (cadr a))))
          (vla-put-closed (vlax-ename->vla-object (cadr a)) :vlax-true)
        );END if
      );END if
    );END foreach
  );END if

  (princ)

  ; v0.1 - 2017.05.12 - Code rewritten and commented
  ; v0.0 - 2016.03.16 - First issue
  ; Author: David Torralba
  ; Last revision: 2017.05.12
)
