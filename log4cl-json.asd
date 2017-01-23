(in-package :cl-user)
(defpackage log4cl-json-asd
  (:use :cl :asdf))
(in-package :log4cl-json-asd)


(defsystem log4cl-json
  :version "0.1.0"
  :author "Alexander Artemenko"
  :license "BSD"
  :depends-on (:log4cl
               :local-time
               :iterate
               :jonathan)
  :components ((:module "src"
                :components
                ((:file "appender"))))
  :description "A JSON appender for log4cl, to stream logs to ElasticSearch."
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.rst"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq)
                (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op log4cl-json-test))))