(define-module (loadtest_cool_controller req session_id)
    (export all))

(defun index (http_method tokens)
    (tuple 'output '"Yeee-haw!"))