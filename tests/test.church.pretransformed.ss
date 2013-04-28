(import

 (except (rnrs) real? negative? positive? zero? >= <= > < = atan cos sin expt log exp sqrt / * - + min)
 (church AD) ;;provides overloaded math ops. should only use when we're doing hmc?
 (rename (except (scheme-tools math) lngamma) (sample-discrete discrete-sampler)) ;;this provides the gsl sampling/scoring functions.
 
 (rnrs mutable-pairs) ;;because the header uses set-car!
 (scheme-tools srfi-compat :1) ;;provides some list functions that are used.
 (srfi :19) ;;date+time for inference timing
 
 (rename (only (church readable-scheme)
               gensym ;;this is needed.
               pretty-print
               exact->inexact
               inexact->exact
               )
         (gensym scheme-gensym))

 (church trie)

 ;;to provide eval in church:
 (church compiler)
 (rnrs eval)

 ;(except (scheme-tools srfi-compat :69) string-ci-hash string-hash) ;;used for CGIS, can comment out otherwise...

 (only (scheme-tools)
       normalize
       string-sort
       bin
       parameterize ;; interventions
       make-parameter ;; interventions                      
       ) 
 )

;;for score gradients:
(define (*with-score-gradient*) #f)
(define tapify (make-tapifier))
(define (min a b) (if (< a b) a b)) ;;FIXME: proper dmin?
(define (continuous? x) (and (real? x) (not (fixnum? x))))(define church-/
  (lambda (address store . args)
    (apply /
      (map (lambda (a) (church-force address store a)) args))))
(define church-*
  (lambda (address store . args)
    (apply *
      (map (lambda (a) (church-force address store a)) args))))
(define church-+
  (lambda (address store . args)
    (apply +
      (map (lambda (a) (church-force address store a)) args))))
(define church--
  (lambda (address store . args)
    (apply -
      (map (lambda (a) (church-force address store a)) args))))
(define church-eq?
  (lambda (address store . args)
    (apply eq?
      (map (lambda (a) (church-force address store a)) args))))
(define church-list
  (lambda (address store . args)
    (apply list
      (map (lambda (a) (church-force address store a)) args))))
(define church-<
  (lambda (address store . args)
    (apply <
      (map (lambda (a) (church-force address store a)) args))))
(define church-expt
  (lambda (address store . args)
    (apply expt
      (map (lambda (a) (church-force address store a)) args))))
(define church-null?
  (lambda (address store . args)
    (apply null?
      (map (lambda (a) (church-force address store a)) args))))
(define church-list-ref
  (lambda (address store . args)
    (apply list-ref
      (map (lambda (a) (church-force address store a)) args))))
(define church-length
  (lambda (address store . args)
    (apply length
      (map (lambda (a) (church-force address store a)) args))))
(define church-=
  (lambda (address store . args)
    (apply =
      (map (lambda (a) (church-force address store a)) args))))
(define church-append
  (lambda (address store . args)
    (apply append
      (map (lambda (a) (church-force address store a)) args))))
(define church-equal?
  (lambda (address store . args)
    (apply equal?
      (map (lambda (a) (church-force address store a)) args))))
(define church-lev-dist
  (lambda (address store . args)
    (apply lev-dist
      (map (lambda (a) (church-force address store a)) args))))
(define church-list?
  (lambda (address store . args)
    (apply list?
      (map (lambda (a) (church-force address store a)) args))))
(define church-display
  (lambda (address store . args)
    (apply display
      (map (lambda (a) (church-force address store a)) args))))
(define church-*with-score-gradient*
  (lambda (address store . args)
    (apply *with-score-gradient*
      (map (lambda (a) (church-force address store a)) args))))
(define church-continuous?
  (lambda (address store . args)
    (apply continuous?
      (map (lambda (a) (church-force address store a)) args))))
(define church-tapify
  (lambda (address store . args)
    (apply tapify
      (map (lambda (a) (church-force address store a)) args))))
(define church-untapify
  (lambda (address store . args)
    (apply untapify
      (map (lambda (a) (church-force address store a)) args))))
(define church-second
  (lambda (address store . args)
    (apply second
      (map (lambda (a) (church-force address store a)) args))))
(define church-random-real
  (lambda (address store . args)
    (apply random-real
      (map (lambda (a) (church-force address store a)) args))))
(define church-car
  (lambda (address store . args)
    (apply car
      (map (lambda (a) (church-force address store a)) args))))
(define church-log
  (lambda (address store . args)
    (apply log
      (map (lambda (a) (church-force address store a)) args))))
(define church-exp
  (lambda (address store . args)
    (apply exp
      (map (lambda (a) (church-force address store a)) args))))
(define church-sample-dirichlet
  (lambda (address store . args)
    (apply sample-dirichlet
      (map (lambda (a) (church-force address store a)) args))))
(define church-dirichlet-lnpdf
  (lambda (address store . args)
    (apply dirichlet-lnpdf
      (map (lambda (a) (church-force address store a)) args))))
(define church-discrete-sampler
  (lambda (address store . args)
    (apply discrete-sampler
      (map (lambda (a) (church-force address store a)) args))))
(define church->=
  (lambda (address store . args)
    (apply >=
      (map (lambda (a) (church-force address store a)) args))))
(define church->
  (lambda (address store . args)
    (apply >
      (map (lambda (a) (church-force address store a)) args))))
(define church-discrete-pdf
  (lambda (address store . args)
    (apply discrete-pdf
      (map (lambda (a) (church-force address store a)) args))))
(define church-iota
  (lambda (address store . args)
    (apply iota
      (map (lambda (a) (church-force address store a)) args))))
(define church-random-integer
  (lambda (address store . args)
    (apply random-integer
      (map (lambda (a) (church-force address store a)) args))))
(define church-integer?
  (lambda (address store . args)
    (apply integer?
      (map (lambda (a) (church-force address store a)) args))))
(define church-sample-gaussian
  (lambda (address store . args)
    (apply sample-gaussian
      (map (lambda (a) (church-force address store a)) args))))
(define church-gaussian-lnpdf
  (lambda (address store . args)
    (apply gaussian-lnpdf
      (map (lambda (a) (church-force address store a)) args))))
(define church-scheme-gensym
  (lambda (address store . args)
    (apply scheme-gensym
      (map (lambda (a) (church-force address store a)) args))))
(define church-lnfact
  (lambda (address store . args)
    (apply lnfact
      (map (lambda (a) (church-force address store a)) args))))
(define church-take
  (lambda (address store . args)
    (apply take
      (map (lambda (a) (church-force address store a)) args))))
(define church-drop
  (lambda (address store . args)
    (apply drop
      (map (lambda (a) (church-force address store a)) args))))
(define church-make-list
  (lambda (address store . args)
    (apply make-list
      (map (lambda (a) (church-force address store a)) args))))
(define church-error
  (lambda (address store . args)
    (apply error
      (map (lambda (a) (church-force address store a)) args))))
(define church-addbox->alist
  (lambda (address store . args)
    (apply addbox->alist
      (map (lambda (a) (church-force address store a)) args))))
(define church-mcmc-state->xrp-draws
  (lambda (address store . args)
    (apply mcmc-state->xrp-draws
      (map (lambda (a) (church-force address store a)) args))))
(define church-addbox-empty?
  (lambda (address store . args)
    (apply addbox-empty?
      (map (lambda (a) (church-force address store a)) args))))
(define church-counterfactual-update
  (lambda (address store . args)
    (apply counterfactual-update
      (map (lambda (a) (church-force address store a)) args))))
(define church-third
  (lambda (address store . args)
    (apply third
      (map (lambda (a) (church-force address store a)) args))))
(define church-xrp-draw-proposer
  (lambda (address store . args)
    (apply xrp-draw-proposer
      (map (lambda (a) (church-force address store a)) args))))
(define church-mcmc-state->score
  (lambda (address store . args)
    (apply mcmc-state->score
      (map (lambda (a) (church-force address store a)) args))))
(define church-min
  (lambda (address store . args)
    (apply min
      (map (lambda (a) (church-force address store a)) args))))
(define church-current-date
  (lambda (address store . args)
    (apply current-date
      (map (lambda (a) (church-force address store a)) args))))
(define church-mcmc-state->query-value
  (lambda (address store . args)
    (apply mcmc-state->query-value
      (map (lambda (a) (church-force address store a)) args))))
(define church-xrp-draw-value
  (lambda (address store . args)
    (apply xrp-draw-value
      (map (lambda (a) (church-force address store a)) args))))
(define church-pull-outof-addbox
  (lambda (address store . args)
    (apply pull-outof-addbox
      (map (lambda (a) (church-force address store a)) args))))
(define church-mcmc-state->gradient
  (lambda (address store . args)
    (apply mcmc-state->gradient
      (map (lambda (a) (church-force address store a)) args))))
(define church-newline
  (lambda (address store . args)
    (apply newline
      (map (lambda (a) (church-force address store a)) args))))
(define church-tape?
  (lambda (address store . args)
    (apply tape?
      (map (lambda (a) (church-force address store a)) args))))
(define church-not
  (lambda (address store . args)
    (apply not
      (map (lambda (a) (church-force address store a)) args))))
(define church-trie-pop
  (lambda (address store . args)
    (apply trie-pop
      (map (lambda (a) (church-force address store a)) args))))
(define church-alist->trie
  (lambda (address store . args)
    (apply alist->trie
      (map (lambda (a) (church-force address store a)) args))))
(define church-nan?
  (lambda (address store . args)
    (apply nan?
      (map (lambda (a) (church-force address store a)) args))))
(define church-exact->inexact
  (lambda (address store . args)
    (apply exact->inexact
      (map (lambda (a) (church-force address store a)) args))))
(define church-max
  (lambda (address store . args)
    (apply max
      (map (lambda (a) (church-force address store a)) args))))
(define church-sqrt
  (lambda (address store . args)
    (apply sqrt
      (map (lambda (a) (church-force address store a)) args))))
(define church-abs
  (lambda (address store . args)
    (apply abs
      (map (lambda (a) (church-force address store a)) args))))
(define (church-apply address store proc args)
  (apply (church-force address store proc) address store
    (church-force address store args)))
(define (church-get-current-environment address store)
  (error 'gce "gce not implemented"))
(define church-true #t)
(define church-false #f)
(define church-pair
  (lambda
    (address store #{g0 |wX38xhs=GZ>3yC6M|}
      #{g1 |Gxw5t/O%pTGxy&8n|})
    (cons
      (church-force address store #{g0 |wX38xhs=GZ>3yC6M|})
      (church-force address store #{g1 |Gxw5t/O%pTGxy&8n|}))))
(define church-first
  (lambda (address store #{g2 |8GV0m58%5JJizTMg|})
    (car
      (church-force address store #{g2 |8GV0m58%5JJizTMg|}))))
(define church-rest
  (lambda (address store #{g3 |>>qMAc<?BEFt?xb!|})
    (cdr
      (church-force address store #{g3 |>>qMAc<?BEFt?xb!|}))))
(define (church-or address store . args)
  (fold (lambda (x y) (or x y)) #f args))
(define (church-and address store . args)
  (fold (lambda (x y) (and x y)) #t args))
(define (lev-dist) (error "lev-dist not implemented"))
(define (church-force address store val)
  (if (and (pair? val) (eq? (car val) 'delayed))
      (church-force address store ((cadr val) address store))
      val))
(define (make-store xrp-draws xrp-stats score tick
          enumeration-flag)
  (list xrp-draws xrp-stats score tick enumeration-flag))
(define (make-empty-store)
  (make-store (make-addbox) (make-addbox) 0.0 0 #f))
(define store->xrp-draws first)
(define store->xrp-stats second)
(define store->score third)
(define store->tick fourth)
(define store->enumeration-flag fifth)
(define (church-reset-store-xrp-draws address store)
  (return-with-store store
    (make-store (make-addbox) (store->xrp-stats store)
      (store->score store) (store->tick store)
      (store->enumeration-flag store))
    'foo))
(define (return-with-store store new-store value)
  (begin
    (set-car! store (car new-store))
    (set-cdr! store (cdr new-store))
    value))
(define alist-insert
  (lambda (addbox address info)
    (cons (cons address info) addbox)))
(define alist-pop
  (lambda (addbox address)
    (if (null? addbox)
        (cons #f '())
        (if (equal? address (caar addbox))
            (cons (cdar addbox) (cdr addbox))
            (let ((ret (alist-pop (cdr addbox) address)))
              (cons (car ret) (cons (car addbox) (cdr ret))))))))
(define (make-empty-alist) '())
(define alist-size length)
(define alist-empty? null?)
(define make-addbox make-empty-trie)
(define add-into-addbox trie-insert)
(define pull-outof-addbox trie-pop)
(define addbox->alist trie->alist)
(define alist->addbox alist->trie)
(define addbox-size trie-size)
(define addbox-empty? trie-empty?)
(define (make-xrp-draw address value xrp-name proposer-thunk
          ticks score support)
  (list address value xrp-name proposer-thunk ticks score
    support))
(define xrp-draw-address first)
(define xrp-draw-value second)
(define xrp-draw-name third)
(define xrp-draw-proposer fourth)
(define xrp-draw-ticks fifth)
(define xrp-draw-score sixth)
(define xrp-draw-support seventh)
(define (church-make-xrp address store xrp-name sample
          incr-stats decr-stats score init-stats hyperparams
          proposer support)
  (let* ((xrp-name (church-force address store xrp-name))
         (sample (church-force address store sample))
         (incr-stats (church-force address store incr-stats))
         (decr-stats (church-force address store decr-stats))
         (score (church-force address store score))
         (init-stats (church-force address store init-stats))
         (hyperparams
          (church-force address store hyperparams))
         (proposer (church-force address store proposer))
         (support (church-force address store support)))
    (return-with-store store
      (let* ((ret
              (pull-outof-addbox (store->xrp-stats store)
                address))
             (oldstats (car ret))
             (reststatsbox (cdr ret))
             (tick (store->tick store)))
        (if (and (not (eq? #f oldstats))
                 (= tick (second oldstats)))
            store
            (make-store (store->xrp-draws store)
              (add-into-addbox reststatsbox address
                (list init-stats tick))
              (store->score store) tick
              (store->enumeration-flag store))))
      (let* ((xrp-address address)
             (proposer
              (if (null? proposer)
                  (lambda (address store operands old-value)
                    (let* ((dec
                            (decr-stats address store
                              old-value
                              (caar
                                (pull-outof-addbox
                                  (store->xrp-stats store)
                                  xrp-address))
                              hyperparams operands))
                           (decstats (second dec))
                           (decscore (third dec))
                           (inc
                            (sample address store decstats
                              hyperparams operands))
                           (proposal-value (first inc))
                           (incscore (third inc)))
                      (list proposal-value incscore decscore)))
                  proposer)))
        (lambda (address store . args)
          (let* ((tmp
                  (pull-outof-addbox
                    (store->xrp-draws store) address))
                 (old-xrp-draw (car tmp))
                 (rest-xrp-draws (cdr tmp))
                 (old-tick
                  (if (eq? #f old-xrp-draw)
                      '()
                      (first (xrp-draw-ticks old-xrp-draw)))))
            (if (equal? (store->tick store) old-tick)
                (return-with-store store store
                  (xrp-draw-value old-xrp-draw))
                (let* ((tmp
                        (pull-outof-addbox
                          (store->xrp-stats store)
                          xrp-address))
                       (stats (caar tmp))
                       (rest-statsbox (cdr tmp))
                       (support-vals
                        (if (null? support)
                            '()
                            (support address store stats
                              hyperparams args)))
                       (tmp
                        (if (eq? #f old-xrp-draw)
                            (if (store->enumeration-flag
                                  store)
                                (incr-stats address store
                                  (first support-vals) stats
                                  hyperparams args)
                                (sample address store stats
                                  hyperparams args))
                            (incr-stats address store
                              (xrp-draw-value old-xrp-draw)
                              stats hyperparams args)))
                       (value (first tmp))
                       (new-stats
                        (list (second tmp)
                          (store->tick store)))
                       (incr-score (third tmp))
                       (new-xrp-draw
                        (make-xrp-draw address value
                          xrp-name
                          (lambda (address store state)
                            (let ((store
                                   (cons
                                     (first
                                       (mcmc-state->store
                                         state))
                                     (cdr
                                       (mcmc-state->store
                                         state)))))
                              (church-apply
                                (mcmc-state->address state)
                                store proposer
                                (list args value))))
                          (cons (store->tick store) old-tick)
                          incr-score support-vals))
                       (new-store
                        (make-store
                          (add-into-addbox rest-xrp-draws
                            address new-xrp-draw)
                          (add-into-addbox rest-statsbox
                            xrp-address new-stats)
                          (+ (store->score store) incr-score)
                          (store->tick store)
                          (store->enumeration-flag store))))
                  (return-with-store store new-store value)))))))))
(define (make-mcmc-state store value address)
  (list store value address))
(define mcmc-state->store first)
(define mcmc-state->address third)
(define (mcmc-state->xrp-draws state)
  (store->xrp-draws (mcmc-state->store state)))
(define (mcmc-state->score state)
  (if (not (eq? #t (first (second state))))
      -inf.0
      (store->score (mcmc-state->store state))))
(define (mcmc-state->gradient state)
  (first
    (second
      (xy-gradient-R
        (lambda (f xrp-draws)
          (filter-map
            (lambda (x)
              (if (tape? (xrp-draw-value x))
                  (cons (xrp-draw-address x)
                    (f (xrp-draw-value x)))
                  #f))
            (map cdr xrp-draws)))
        (addbox->alist (mcmc-state->xrp-draws state))
        (mcmc-state->score state) tapify))))
(define (mcmc-state->query-value state)
  (let ((store
         (cons (first (mcmc-state->store state))
           (cdr (mcmc-state->store state)))))
    (church-apply (mcmc-state->address state) store
      (cdr (second state)) '())))
(define (church-make-initial-mcmc-state address store)
  (make-mcmc-state (cons (first store) (cdr store))
    'init-val address))
(define (church-make-initial-enumeration-state address store)
  (make-mcmc-state
    (make-store '() (store->xrp-stats store)
      (store->score store) (store->tick store) #t)
    'init-val address))
(define (counterfactual-update state nfqp . interventions)
  (let* ((new-tick
          (+ 1 (store->tick (mcmc-state->store state))))
         (interv-store
          (make-store
            (fold
              (lambda (interv xrps)
                (add-into-addbox
                  (cdr
                    (pull-outof-addbox xrps
                      (xrp-draw-address (first interv))))
                  (xrp-draw-address (first interv))
                  (make-xrp-draw
                    (xrp-draw-address (first interv))
                    (cdr interv)
                    (xrp-draw-name (first interv))
                    (xrp-draw-proposer (first interv))
                    (xrp-draw-ticks (first interv))
                    'dummy-score
                    (xrp-draw-support (first interv)))))
              (store->xrp-draws (mcmc-state->store state))
              interventions)
            (store->xrp-stats (mcmc-state->store state)) 0.0
            new-tick
            (store->enumeration-flag
              (mcmc-state->store state))))
         (ret
          (list
            (church-apply (mcmc-state->address state)
              interv-store nfqp '())
            interv-store))
         (value (first ret))
         (new-store (second ret))
         (ret2
          (if (store->enumeration-flag new-store)
              (list new-store 0)
              (clean-store new-store)))
         (new-store (first ret2))
         (cd-bw/fw (second ret2))
         (proposal-state
          (make-mcmc-state new-store value
            (mcmc-state->address state))))
    (list proposal-state cd-bw/fw)))
(define (clean-store store)
  (let* ((state-tick (store->tick store))
         (draws-bw/fw
          (let loop ((draws
                      (addbox->alist
                        (store->xrp-draws store)))
                     (used-draws '())
                     (bw/fw 0.0))
            (if (null? draws)
                (list used-draws bw/fw)
                (if (= (first (xrp-draw-ticks (cdar draws)))
                      state-tick)
                    (if (null?
                          (cdr (xrp-draw-ticks (cdar draws))))
                        (loop (cdr draws)
                          (cons (car draws) used-draws)
                          (- bw/fw
                            (xrp-draw-score (cdar draws))))
                        (loop (cdr draws)
                          (cons (car draws) used-draws)
                          bw/fw))
                    (loop (cdr draws) used-draws
                      (+ bw/fw (xrp-draw-score (cdar draws)))))))))
    (list
      (make-store (alist->addbox (first draws-bw/fw))
        (store->xrp-stats store) (store->score store)
        (store->tick store) (store->enumeration-flag store))
      (second draws-bw/fw))))
(define *intervention* (make-parameter #f))
(define (church-*intervention* address store)
  (*intervention*))
(define (church-with-interventions address store state proc)
  (parameterize ((*intervention* #t))
    (proc (mcmc-state->address state)
      (mcmc-state->store state))))
(define (church-main address store)
  (letrec ((church-sample
            (lambda (address store church-thunk)
              ((church-force (cons 'a1 address) store
                 church-thunk)
                (cons 'a2 address) store)))
           (church-uniform-draw
            (lambda (address store church-lst)
              (if (church-force (cons 'a3 address) store
                    ((church-force (cons 'a4 address) store
                       church-null?)
                      (cons 'a5 address) store church-lst))
                  '()
                  ((church-force (cons 'a6 address) store
                     church-list-ref)
                    (cons 'a7 address) store church-lst
                    ((church-force (cons 'a8 address) store
                       church-sample-integer)
                      (cons 'a9 address) store
                      ((church-force (cons 'a10 address)
                         store church-length)
                        (cons 'a11 address) store church-lst))))))
           (church-all
            (lambda (address store church-lst)
              ((church-force (cons 'a12 address) store
                 church-apply)
                (cons 'a13 address) store church-and
                church-lst)))
           (church-any
            (lambda (address store church-lst)
              ((church-force (cons 'a14 address) store
                 church-apply)
                (cons 'a15 address) store church-or
                church-lst)))
           (church-product
            (lambda (address store church-lst)
              ((church-force (cons 'a16 address) store
                 church-apply)
                (cons 'a17 address) store church-*
                church-lst)))
           (church-sum
            (lambda (address store church-lst)
              ((church-force (cons 'a18 address) store
                 church-apply)
                (cons 'a19 address) store church-+
                church-lst)))
           (church-repeat
            (lambda (address store church-N church-proc)
              (if (church-force (cons 'a20 address) store
                    ((church-force (cons 'a21 address) store
                       church-=)
                      (cons 'a22 address) store church-N 0))
                  '()
                  ((church-force (cons 'a23 address) store
                     church-pair)
                    (cons 'a24 address) store
                    ((church-force (cons 'a25 address) store
                       church-proc)
                      (cons 'a26 address) store)
                    ((church-force (cons 'a27 address) store
                       church-repeat)
                      (cons 'a28 address) store
                      ((church-force (cons 'a29 address)
                         store church--)
                        (cons 'a30 address) store church-N 1)
                      church-proc)))))
           (church-for-each
            (lambda (address store church-proc church-lst)
              (if (church-force (cons 'a31 address) store
                    ((church-force (cons 'a32 address) store
                       church-null?)
                      (cons 'a33 address) store church-lst))
                  '()
                  (begin
                    (church-force (cons 'a34 address) store
                      ((church-force (cons 'a35 address)
                         store church-proc)
                        (cons 'a36 address) store
                        ((church-force (cons 'a37 address)
                           store church-first)
                          (cons 'a38 address) store
                          church-lst)))
                    ((church-force (cons 'a39 address) store
                       church-for-each)
                      (cons 'a40 address) store church-proc
                      ((church-force (cons 'a41 address)
                         store church-rest)
                        (cons 'a42 address) store church-lst))))))
           (church-fold
            (lambda
              (address store church-proc church-init
               . church-lsts)
              (if (church-force (cons 'a43 address) store
                    ((church-force (cons 'a44 address) store
                       church-null?)
                      (cons 'a45 address) store
                      ((church-force (cons 'a46 address)
                         store church-first)
                        (cons 'a47 address) store
                        church-lsts)))
                  church-init
                  ((church-force (cons 'a48 address) store
                     church-apply)
                    (cons 'a49 address) store church-fold
                    ((church-force (cons 'a50 address) store
                       church-pair)
                      (cons 'a51 address) store church-proc
                      ((church-force (cons 'a52 address)
                         store church-pair)
                        (cons 'a53 address) store
                        ((church-force (cons 'a54 address)
                           store church-apply)
                          (cons 'a55 address) store
                          church-proc
                          ((church-force (cons 'a56 address)
                             store church-append)
                            (cons 'a57 address) store
                            ((church-force
                               (cons 'a58 address) store
                               church-single-map)
                              (cons 'a59 address) store
                              church-first church-lsts)
                            ((church-force
                               (cons 'a60 address) store
                               church-list)
                              (cons 'a61 address) store
                              church-init)))
                        ((church-force (cons 'a62 address)
                           store church-single-map)
                          (cons 'a63 address) store
                          church-rest church-lsts)))))))
           (church-reverse
            (lambda (address store church-lst)
              ((church-force (cons 'a64 address) store
                 church-fold)
                (cons 'a65 address) store church-pair '()
                church-lst)))
           (church-map
            (lambda
              (address store church-proc . church-lsts)
              (if (church-force (cons 'a66 address) store
                    ((church-force (cons 'a67 address) store
                       church-null?)
                      (cons 'a68 address) store
                      ((church-force (cons 'a69 address)
                         store church-rest)
                        (cons 'a70 address) store
                        church-lsts)))
                  ((church-force (cons 'a71 address) store
                     church-single-map)
                    (cons 'a72 address) store church-proc
                    ((church-force (cons 'a73 address) store
                       church-first)
                      (cons 'a74 address) store church-lsts))
                  ((church-force (cons 'a75 address) store
                     church-multi-map)
                    (cons 'a76 address) store church-proc
                    church-lsts))))
           (church-single-map
            (lambda (address store church-proc church-lst)
              (if (church-force (cons 'a77 address) store
                    ((church-force (cons 'a78 address) store
                       church-null?)
                      (cons 'a79 address) store church-lst))
                  '()
                  ((church-force (cons 'a80 address) store
                     church-pair)
                    (cons 'a81 address) store
                    ((church-force (cons 'a82 address) store
                       church-proc)
                      (cons 'a83 address) store
                      ((church-force (cons 'a84 address)
                         store church-first)
                        (cons 'a85 address) store church-lst))
                    ((church-force (cons 'a86 address) store
                       church-map)
                      (cons 'a87 address) store church-proc
                      ((church-force (cons 'a88 address)
                         store church-rest)
                        (cons 'a89 address) store church-lst))))))
           (church-multi-map
            (lambda (address store church-proc church-lsts)
              (if (church-force (cons 'a90 address) store
                    ((church-force (cons 'a91 address) store
                       church-null?)
                      (cons 'a92 address) store
                      ((church-force (cons 'a93 address)
                         store church-first)
                        (cons 'a94 address) store
                        church-lsts)))
                  '()
                  ((church-force (cons 'a95 address) store
                     church-pair)
                    (cons 'a96 address) store
                    ((church-force (cons 'a97 address) store
                       church-apply)
                      (cons 'a98 address) store church-proc
                      ((church-force (cons 'a99 address)
                         store church-single-map)
                        (cons 'a100 address) store
                        church-first church-lsts))
                    ((church-force (cons 'a101 address)
                       store church-multi-map)
                      (cons 'a102 address) store church-proc
                      ((church-force (cons 'a103 address)
                         store church-single-map)
                        (cons 'a104 address) store
                        church-rest church-lsts))))))
           (church-many-map
            (lambda
              (address store church-proc . church-lsts)
              ((church-force (cons 'a105 address) store
                 church-multi-map)
                (cons 'a106 address) store church-proc
                church-lsts)))
           (church-filter
            (lambda (address store church-pred church-lst)
              (if (church-force (cons 'a107 address) store
                    ((church-force (cons 'a108 address)
                       store church-null?)
                      (cons 'a109 address) store church-lst))
                  '()
                  (if (church-force (cons 'a110 address)
                        store
                        ((church-force (cons 'a111 address)
                           store church-pred)
                          (cons 'a112 address) store
                          ((church-force
                             (cons 'a113 address) store
                             church-first)
                            (cons 'a114 address) store
                            church-lst)))
                      ((church-force (cons 'a115 address)
                         store church-pair)
                        (cons 'a116 address) store
                        ((church-force (cons 'a117 address)
                           store church-first)
                          (cons 'a118 address) store
                          church-lst)
                        ((church-force (cons 'a119 address)
                           store church-filter)
                          (cons 'a120 address) store
                          church-pred
                          ((church-force
                             (cons 'a121 address) store
                             church-rest)
                            (cons 'a122 address) store
                            church-lst)))
                      ((church-force (cons 'a123 address)
                         store church-filter)
                        (cons 'a124 address) store
                        church-pred
                        ((church-force (cons 'a125 address)
                           store church-rest)
                          (cons 'a126 address) store
                          church-lst))))))
           (church-filter-map
            (lambda (address store church-proc church-lst)
              (if (church-force (cons 'a127 address) store
                    ((church-force (cons 'a128 address)
                       store church-null?)
                      (cons 'a129 address) store church-lst))
                  '()
                  ((church-force (cons 'a130 address) store
                     (lambda (address store church-val)
                       (if (church-force
                             (cons 'a131 address) store
                             church-val)
                           ((church-force
                              (cons 'a132 address) store
                              church-pair)
                             (cons 'a133 address) store
                             church-val
                             ((church-force
                                (cons 'a134 address) store
                                church-filter-map)
                               (cons 'a135 address) store
                               church-proc
                               ((church-force
                                  (cons 'a136 address) store
                                  church-rest)
                                 (cons 'a137 address) store
                                 church-lst)))
                           ((church-force
                              (cons 'a138 address) store
                              church-filter-map)
                             (cons 'a139 address) store
                             church-proc
                             ((church-force
                                (cons 'a140 address) store
                                church-rest)
                               (cons 'a141 address) store
                               church-lst)))))
                    (cons 'a142 address) store
                    ((church-force (cons 'a143 address)
                       store church-proc)
                      (cons 'a144 address) store
                      ((church-force (cons 'a145 address)
                         store church-first)
                        (cons 'a146 address) store
                        church-lst))))))
           (church-list-index
            (lambda
              (address store church-pred church-lst
               . church-i)
              (if (church-force (cons 'a147 address) store
                    ((church-force (cons 'a148 address)
                       store church-null?)
                      (cons 'a149 address) store church-lst))
                  church-false
                  ((church-force (cons 'a150 address) store
                     (lambda (address store church-i)
                       (if (church-force
                             (cons 'a151 address) store
                             ((church-force
                                (cons 'a152 address) store
                                church-pred)
                               (cons 'a153 address) store
                               ((church-force
                                  (cons 'a154 address) store
                                  church-first)
                                 (cons 'a155 address) store
                                 church-lst)))
                           church-i
                           ((church-force
                              (cons 'a156 address) store
                              church-list-index)
                             (cons 'a157 address) store
                             church-pred
                             ((church-force
                                (cons 'a158 address) store
                                church-rest)
                               (cons 'a159 address) store
                               church-lst)
                             ((church-force
                                (cons 'a160 address) store
                                church-+)
                               (cons 'a161 address) store
                               church-i 1)))))
                    (cons 'a162 address) store
                    (if (church-force (cons 'a163 address)
                          store
                          ((church-force
                             (cons 'a164 address) store
                             church-null?)
                            (cons 'a165 address) store
                            church-i))
                        0
                        ((church-force (cons 'a166 address)
                           store church-first)
                          (cons 'a167 address) store
                          church-i))))))
           (church-zip
            (lambda (address store . church-lists)
              ((church-force (cons 'a168 address) store
                 church-multi-map)
                (cons 'a169 address) store church-list
                church-lists)))
           (church-rejection-query
            (lambda (address store church-nfqp)
              ((church-force (cons 'a170 address) store
                 (lambda (address store church-val)
                   (if (church-force (cons 'a171 address)
                         store
                         ((church-force (cons 'a172 address)
                            store church-first)
                           (cons 'a173 address) store
                           church-val))
                       ((church-force (cons 'a174 address)
                          store
                          ((church-force
                             (cons 'a175 address) store
                             church-rest)
                            (cons 'a176 address) store
                            church-val))
                         (cons 'a177 address) store)
                       ((church-force (cons 'a178 address)
                          store church-rejection-query)
                         (cons 'a179 address) store
                         church-nfqp))))
                (cons 'a180 address) store
                ((church-force (cons 'a181 address) store
                   church-nfqp)
                  (cons 'a182 address) store))))
           (church-discrete church-sample-discrete)
           (church-multinomial
            (lambda (address store church-vals church-probs)
              ((church-force (cons 'a183 address) store
                 church-list-ref)
                (cons 'a184 address) store church-vals
                ((church-force (cons 'a185 address) store
                   church-discrete)
                  (cons 'a186 address) store church-probs))))
           (church-beta
            (lambda (address store church-a church-b)
              ((church-force (cons 'a187 address) store
                 church-dirichlet)
                (cons 'a188 address) store
                ((church-force (cons 'a189 address) store
                   church-list)
                  (cons 'a190 address) store church-a
                  church-b))))
           (church-make-GEM
            (lambda (address store church-alpha)
              ((church-force (cons 'a191 address) store
                 (lambda (address store church-sticks)
                   (lambda (address store)
                     ((church-force (cons 'a192 address)
                        store church-pick-a-stick)
                       (cons 'a193 address) store
                       church-sticks 1))))
                (cons 'a194 address) store
                ((lambda (mem-address store proc)
                   (lambda (address store . args)
                     (church-apply (cons args mem-address)
                       store proc args)))
                  address store
                  (lambda (address store church-x)
                    ((church-force (cons 'a195 address)
                       store church-beta)
                      (cons 'a196 address) store 1.0
                      church-alpha))))))
           (church-pick-a-stick
            (lambda (address store church-sticks church-J)
              (if (church-force (cons 'a197 address) store
                    ((church-force (cons 'a198 address)
                       store church-flip)
                      (cons 'a199 address) store
                      ((church-force (cons 'a200 address)
                         store church-sticks)
                        (cons 'a201 address) store church-J)))
                  church-J
                  ((church-force (cons 'a202 address) store
                     church-pick-a-stick)
                    (cons 'a203 address) store church-sticks
                    ((church-force (cons 'a204 address)
                       store church-+)
                      (cons 'a205 address) store church-J 1)))))
           (church-sticky-DPmem
            (lambda (address store church-alpha church-proc)
              ((church-force (cons 'a206 address) store
                 (lambda
                   (address store church-augmented-proc
                     church-crps)
                   (lambda (address store . church-argsin)
                     ((church-force (cons 'a207 address)
                        store church-augmented-proc)
                       (cons 'a208 address) store
                       church-argsin
                       ((church-force (cons 'a209 address)
                          store
                          ((church-force
                             (cons 'a210 address) store
                             church-crps)
                            (cons 'a211 address) store
                            church-argsin))
                         (cons 'a212 address) store)))))
                (cons 'a213 address) store
                ((lambda (mem-address store proc)
                   (lambda (address store . args)
                     (church-apply (cons args mem-address)
                       store proc args)))
                  address store
                  (lambda
                    (address store church-args church-part)
                    ((church-force (cons 'a214 address)
                       store church-apply)
                      (cons 'a215 address) store church-proc
                      church-args)))
                ((lambda (mem-address store proc)
                   (lambda (address store . args)
                     (church-apply (cons args mem-address)
                       store proc args)))
                  address store
                  (lambda (address store church-args)
                    ((church-force (cons 'a216 address)
                       store church-make-GEM)
                      (cons 'a217 address) store
                      church-alpha))))))
           (church-make-PYP
            (lambda (address store church-a church-b)
              ((church-force (cons 'a218 address) store
                 (lambda (address store church-sticks)
                   (lambda (address store)
                     ((church-force (cons 'a219 address)
                        store church-pick-a-stick)
                       (cons 'a220 address) store
                       church-sticks 1))))
                (cons 'a221 address) store
                ((lambda (mem-address store proc)
                   (lambda (address store . args)
                     (church-apply (cons args mem-address)
                       store proc args)))
                  address store
                  (lambda (address store church-x)
                    ((church-force (cons 'a222 address)
                       store church-first)
                      (cons 'a223 address) store
                      ((church-force (cons 'a224 address)
                         store church-beta)
                        (cons 'a225 address) store
                        ((church-force (cons 'a226 address)
                           store church--)
                          (cons 'a227 address) store 1.0
                          church-a)
                        ((church-force (cons 'a228 address)
                           store church-+)
                          (cons 'a229 address) store
                          church-b
                          ((church-force
                             (cons 'a230 address) store
                             church-*)
                            (cons 'a231 address) store
                            church-a church-x)))))))))
           (church-PYmem
            (lambda
              (address store church-a church-b church-proc)
              ((church-force (cons 'a232 address) store
                 (lambda
                   (address store church-augmented-proc
                     church-crps)
                   (lambda (address store . church-argsin)
                     ((church-force (cons 'a233 address)
                        store church-augmented-proc)
                       (cons 'a234 address) store
                       church-argsin
                       ((church-force (cons 'a235 address)
                          store
                          ((church-force
                             (cons 'a236 address) store
                             church-crps)
                            (cons 'a237 address) store
                            church-argsin))
                         (cons 'a238 address) store)))))
                (cons 'a239 address) store
                ((lambda (mem-address store proc)
                   (lambda (address store . args)
                     (church-apply (cons args mem-address)
                       store proc args)))
                  address store
                  (lambda
                    (address store church-args church-part)
                    ((church-force (cons 'a240 address)
                       store church-apply)
                      (cons 'a241 address) store church-proc
                      church-args)))
                ((lambda (mem-address store proc)
                   (lambda (address store . args)
                     (church-apply (cons args mem-address)
                       store proc args)))
                  address store
                  (lambda (address store church-args)
                    ((church-force (cons 'a242 address)
                       store church-make-PYP)
                      (cons 'a243 address) store church-a
                      church-b))))))
           (church-noisy-lev-list-equal?
            (lambda
              (address store church-list1 church-list2
                church-coupling)
              (if (church-force (cons 'a244 address) store
                    ((church-force (cons 'a245 address)
                       store church-=)
                      (cons 'a246 address) store 0.0
                      church-coupling))
                  ((church-force (cons 'a247 address) store
                     church-equal?)
                    (cons 'a248 address) store church-list1
                    church-list2)
                  ((church-force (cons 'a249 address) store
                     church-flip)
                    (cons 'a250 address) store
                    ((church-force (cons 'a251 address)
                       store church-expt)
                      (cons 'a252 address) store
                      church-coupling
                      ((church-force (cons 'a253 address)
                         store church-lev-dist)
                        (cons 'a254 address) store
                        church-list1 church-list2))))))
           (church-flatten
            (lambda (address store church-lst)
              (if (church-force (cons 'a255 address) store
                    ((church-force (cons 'a256 address)
                       store church-null?)
                      (cons 'a257 address) store church-lst))
                  '()
                  (if (church-force (cons 'a258 address)
                        store
                        ((church-force (cons 'a259 address)
                           store church-list?)
                          (cons 'a260 address) store
                          ((church-force
                             (cons 'a261 address) store
                             church-first)
                            (cons 'a262 address) store
                            church-lst)))
                      ((church-force (cons 'a263 address)
                         store church-append)
                        (cons 'a264 address) store
                        ((church-force (cons 'a265 address)
                           store church-flatten)
                          (cons 'a266 address) store
                          ((church-force
                             (cons 'a267 address) store
                             church-first)
                            (cons 'a268 address) store
                            church-lst))
                        ((church-force (cons 'a269 address)
                           store church-flatten)
                          (cons 'a270 address) store
                          ((church-force
                             (cons 'a271 address) store
                             church-rest)
                            (cons 'a272 address) store
                            church-lst)))
                      ((church-force (cons 'a273 address)
                         store church-pair)
                        (cons 'a274 address) store
                        ((church-force (cons 'a275 address)
                           store church-first)
                          (cons 'a276 address) store
                          church-lst)
                        ((church-force (cons 'a277 address)
                           store church-flatten)
                          (cons 'a278 address) store
                          ((church-force
                             (cons 'a279 address) store
                             church-rest)
                            (cons 'a280 address) store
                            church-lst)))))))
           (church-mean
            (lambda (address store church-lst)
              ((church-force (cons 'a281 address) store
                 church-/)
                (cons 'a282 address) store
                ((church-force (cons 'a283 address) store
                   church-apply)
                  (cons 'a284 address) store church-+
                  church-lst)
                ((church-force (cons 'a285 address) store
                   church-length)
                  (cons 'a286 address) store church-lst))))
           (church-variance
            (lambda (address store church-lst)
              ((church-force (cons 'a287 address) store
                 (lambda (address store church-mn)
                   ((church-force (cons 'a288 address) store
                      church-mean)
                     (cons 'a289 address) store
                     ((church-force (cons 'a290 address)
                        store church-map)
                       (cons 'a291 address) store
                       (lambda (address store church-x)
                         ((church-force (cons 'a292 address)
                            store church-expt)
                           (cons 'a293 address) store
                           ((church-force
                              (cons 'a294 address) store
                              church--)
                             (cons 'a295 address) store
                             church-x church-mn)
                           2))
                       church-lst))))
                (cons 'a296 address) store
                ((church-force (cons 'a297 address) store
                   church-mean)
                  (cons 'a298 address) store church-lst))))
           (church-no-proposals
            (lambda (address store church-x)
              (begin
                (church-force (cons 'a299 address) store
                  ((church-force (cons 'a300 address) store
                     church-display)
                    (cons 'a301 address) store
                    "warning: no-proposals not implemented.\n"))
                church-x)))
           (church-make-stateless-xrp
            (lambda
              (address store church-xrp-name church-sampler
               church-scorer . church-proposal-support)
              ((church-force (cons 'a302 address) store
                 church-make-xrp)
                (cons 'a303 address) store church-xrp-name
                (lambda
                  (address store church-stats
                    church-hyperparams church-args)
                  ((church-force (cons 'a304 address) store
                     (lambda (address store church-value)
                       ((church-force (cons 'a305 address)
                          store
                          (lambda
                            (address store church-value)
                            ((church-force
                               (cons 'a306 address) store
                               church-list)
                              (cons 'a307 address) store
                              church-value church-stats
                              ((church-force
                                 (cons 'a308 address) store
                                 church-scorer)
                                (cons 'a309 address) store
                                church-args church-value))))
                         (cons 'a310 address) store
                         (if (church-force
                               (cons 'a311 address) store
                               ((church-force
                                  (cons 'a312 address) store
                                  church-and)
                                 (cons 'a313 address) store
                                 ((church-force
                                    (cons 'a314 address)
                                    store
                                    church-*with-score-gradient*)
                                   (cons 'a315 address)
                                   store)
                                 ((church-force
                                    (cons 'a316 address)
                                    store church-continuous?)
                                   (cons 'a317 address)
                                   store church-value)))
                             ((church-force
                                (cons 'a318 address) store
                                church-tapify)
                               (cons 'a319 address) store
                               ((church-force
                                  (cons 'a320 address) store
                                  church-untapify)
                                 (cons 'a321 address) store
                                 church-value))
                             church-value))))
                    (cons 'a322 address) store
                    ((church-force (cons 'a323 address)
                       store church-apply)
                      (cons 'a324 address) store
                      church-sampler church-args)))
                (lambda
                  (address store church-value church-stats
                    church-hyperparams church-args)
                  ((church-force (cons 'a325 address) store
                     (lambda (address store church-value)
                       ((church-force (cons 'a326 address)
                          store church-list)
                         (cons 'a327 address) store
                         church-value church-stats
                         ((church-force (cons 'a328 address)
                            store church-scorer)
                           (cons 'a329 address) store
                           church-args church-value))))
                    (cons 'a330 address) store
                    (if (church-force (cons 'a331 address)
                          store
                          ((church-force
                             (cons 'a332 address) store
                             church-and)
                            (cons 'a333 address) store
                            ((church-force
                               (cons 'a334 address) store
                               church-*with-score-gradient*)
                              (cons 'a335 address) store)
                            ((church-force
                               (cons 'a336 address) store
                               church-continuous?)
                              (cons 'a337 address) store
                              church-value)))
                        ((church-force (cons 'a338 address)
                           store church-tapify)
                          (cons 'a339 address) store
                          ((church-force
                             (cons 'a340 address) store
                             church-untapify)
                            (cons 'a341 address) store
                            church-value))
                        church-value)))
                (lambda
                  (address store church-value church-stats
                    church-hyperparams church-args)
                  ((church-force (cons 'a342 address) store
                     (lambda (address store church-value)
                       ((church-force (cons 'a343 address)
                          store church-list)
                         (cons 'a344 address) store
                         church-value church-stats
                         ((church-force (cons 'a345 address)
                            store church-scorer)
                           (cons 'a346 address) store
                           church-args church-value))))
                    (cons 'a347 address) store
                    (if (church-force (cons 'a348 address)
                          store
                          ((church-force
                             (cons 'a349 address) store
                             church-and)
                            (cons 'a350 address) store
                            ((church-force
                               (cons 'a351 address) store
                               church-*with-score-gradient*)
                              (cons 'a352 address) store)
                            ((church-force
                               (cons 'a353 address) store
                               church-continuous?)
                              (cons 'a354 address) store
                              church-value)))
                        ((church-force (cons 'a355 address)
                           store church-tapify)
                          (cons 'a356 address) store
                          ((church-force
                             (cons 'a357 address) store
                             church-untapify)
                            (cons 'a358 address) store
                            church-value))
                        church-value)))
                'scorer '() '()
                (if (church-force (cons 'a359 address) store
                      ((church-force (cons 'a360 address)
                         store church-null?)
                        (cons 'a361 address) store
                        church-proposal-support))
                    '()
                    ((church-force (cons 'a362 address)
                       store church-first)
                      (cons 'a363 address) store
                      church-proposal-support))
                (if (church-force (cons 'a364 address) store
                      ((church-force (cons 'a365 address)
                         store church-null?)
                        (cons 'a366 address) store
                        church-proposal-support))
                    '()
                    (if (church-force (cons 'a367 address)
                          store
                          ((church-force
                             (cons 'a368 address) store
                             church-null?)
                            (cons 'a369 address) store
                            ((church-force
                               (cons 'a370 address) store
                               church-rest)
                              (cons 'a371 address) store
                              church-proposal-support)))
                        '()
                        ((church-force (cons 'a372 address)
                           store
                           (lambda (address store church-pr)
                             (lambda
                               (address store church-stats
                                 church-hyperparams
                                 church-args)
                               ((church-force
                                  (cons 'a373 address) store
                                  church-pr)
                                 (cons 'a374 address) store
                                 church-args))))
                          (cons 'a375 address) store
                          ((church-force
                             (cons 'a376 address) store
                             church-second)
                            (cons 'a377 address) store
                            church-proposal-support)))))))
           (church-flip
            ((church-force (cons 'a378 address) store
               church-make-stateless-xrp)
              (cons 'a379 address) store 'flip
              (lambda (address store . church-w)
                (if (church-force (cons 'a380 address) store
                      ((church-force (cons 'a381 address)
                         store church-null?)
                        (cons 'a382 address) store church-w))
                    ((church-force (cons 'a383 address)
                       store church-<)
                      (cons 'a384 address) store
                      ((church-force (cons 'a385 address)
                         store church-random-real)
                        (cons 'a386 address) store)
                      0.5)
                    ((church-force (cons 'a387 address)
                       store church-<)
                      (cons 'a388 address) store
                      ((church-force (cons 'a389 address)
                         store church-random-real)
                        (cons 'a390 address) store)
                      ((church-force (cons 'a391 address)
                         store church-car)
                        (cons 'a392 address) store church-w))))
              (lambda (address store church-args church-val)
                (if (church-force (cons 'a393 address) store
                      ((church-force (cons 'a394 address)
                         store church-null?)
                        (cons 'a395 address) store
                        church-args))
                    ((church-force (cons 'a396 address)
                       store church--)
                      (cons 'a397 address) store
                      ((church-force (cons 'a398 address)
                         store church-log)
                        (cons 'a399 address) store 2.0))
                    (if (church-force (cons 'a400 address)
                          store church-val)
                        ((church-force (cons 'a401 address)
                           store church-log)
                          (cons 'a402 address) store
                          ((church-force
                             (cons 'a403 address) store
                             church-first)
                            (cons 'a404 address) store
                            church-args))
                        ((church-force (cons 'a405 address)
                           store church-log)
                          (cons 'a406 address) store
                          ((church-force
                             (cons 'a407 address) store
                             church--)
                            (cons 'a408 address) store 1
                            ((church-force
                               (cons 'a409 address) store
                               church-first)
                              (cons 'a410 address) store
                              church-args))))))
              '()
              (lambda (address store church-args)
                ((church-force (cons 'a411 address) store
                   church-list)
                  (cons 'a412 address) store church-true
                  church-false))))
           (church-log-flip
            ((church-force (cons 'a413 address) store
               church-make-stateless-xrp)
              (cons 'a414 address) store 'log-flip
              (lambda (address store . church-w)
                (if (church-force (cons 'a415 address) store
                      ((church-force (cons 'a416 address)
                         store church-null?)
                        (cons 'a417 address) store church-w))
                    ((church-force (cons 'a418 address)
                       store church-<)
                      (cons 'a419 address) store
                      ((church-force (cons 'a420 address)
                         store church-random-real)
                        (cons 'a421 address) store)
                      0.5)
                    ((church-force (cons 'a422 address)
                       store church-<)
                      (cons 'a423 address) store
                      ((church-force (cons 'a424 address)
                         store church-log)
                        (cons 'a425 address) store
                        ((church-force (cons 'a426 address)
                           store church-random-real)
                          (cons 'a427 address) store))
                      ((church-force (cons 'a428 address)
                         store church-car)
                        (cons 'a429 address) store church-w))))
              (lambda (address store church-args church-val)
                (if (church-force (cons 'a430 address) store
                      ((church-force (cons 'a431 address)
                         store church-null?)
                        (cons 'a432 address) store
                        church-args))
                    ((church-force (cons 'a433 address)
                       store church--)
                      (cons 'a434 address) store
                      ((church-force (cons 'a435 address)
                         store church-log)
                        (cons 'a436 address) store 2.0))
                    (if (church-force (cons 'a437 address)
                          store church-val)
                        ((church-force (cons 'a438 address)
                           store church-first)
                          (cons 'a439 address) store
                          church-args)
                        ((church-force (cons 'a440 address)
                           store church-log)
                          (cons 'a441 address) store
                          ((church-force
                             (cons 'a442 address) store
                             church--)
                            (cons 'a443 address) store 1.0
                            ((church-force
                               (cons 'a444 address) store
                               church-exp)
                              (cons 'a445 address) store
                              ((church-force
                                 (cons 'a446 address) store
                                 church-first)
                                (cons 'a447 address) store
                                church-args)))))))))
           (church-dirichlet
            ((church-force (cons 'a448 address) store
               church-make-stateless-xrp)
              (cons 'a449 address) store 'dirichlet
              church-sample-dirichlet
              (lambda (address store church-args church-val)
                ((church-force (cons 'a450 address) store
                   church-dirichlet-lnpdf)
                  (cons 'a451 address) store
                  ((church-force (cons 'a452 address) store
                     church-first)
                    (cons 'a453 address) store church-args)
                  church-val))))
           (church-sample-discrete
            ((church-force (cons 'a454 address) store
               church-make-stateless-xrp)
              (cons 'a455 address) store 'sample-discrete
              church-discrete-sampler
              (lambda (address store church-args church-val)
                (if (church-force (cons 'a456 address) store
                      ((church-force (cons 'a457 address)
                         store church->=)
                        (cons 'a458 address) store
                        church-val
                        ((church-force (cons 'a459 address)
                           store church-length)
                          (cons 'a460 address) store
                          ((church-force
                             (cons 'a461 address) store
                             church-first)
                            (cons 'a462 address) store
                            church-args))))
                    -inf.0
                    ((church-force (cons 'a463 address)
                       store
                       (lambda (address store church-p)
                         (if (church-force
                               (cons 'a464 address) store
                               ((church-force
                                  (cons 'a465 address) store
                                  church->)
                                 (cons 'a466 address) store
                                 church-p 0))
                             ((church-force
                                (cons 'a467 address) store
                                church-log)
                               (cons 'a468 address) store
                               church-p)
                             -inf.0)))
                      (cons 'a469 address) store
                      ((church-force (cons 'a470 address)
                         store church-discrete-pdf)
                        (cons 'a471 address) store
                        ((church-force (cons 'a472 address)
                           store church-first)
                          (cons 'a473 address) store
                          church-args)
                        church-val))))
              '()
              (lambda (address store church-args)
                ((church-force (cons 'a474 address) store
                   church-iota)
                  (cons 'a475 address) store
                  ((church-force (cons 'a476 address) store
                     church-length)
                    (cons 'a477 address) store
                    ((church-force (cons 'a478 address)
                       store church-first)
                      (cons 'a479 address) store church-args))))))
           (church-sample-integer
            ((church-force (cons 'a480 address) store
               church-make-stateless-xrp)
              (cons 'a481 address) store 'sample-integer
              church-random-integer
              (lambda (address store church-args church-val)
                ((church-force (cons 'a482 address) store
                   (lambda (address store church-n)
                     (if (church-force (cons 'a483 address)
                           store
                           ((church-force
                              (cons 'a484 address) store
                              church-and)
                             (cons 'a485 address) store
                             ((church-force
                                (cons 'a486 address) store
                                church-integer?)
                               (cons 'a487 address) store
                               church-val)
                             ((church-force
                                (cons 'a488 address) store
                                church->=)
                               (cons 'a489 address) store
                               church-val 0)
                             ((church-force
                                (cons 'a490 address) store
                                church-<)
                               (cons 'a491 address) store
                               church-val church-n)))
                         ((church-force (cons 'a492 address)
                            store church--)
                           (cons 'a493 address) store
                           ((church-force
                              (cons 'a494 address) store
                              church-log)
                             (cons 'a495 address) store
                             church-n))
                         -inf.0)))
                  (cons 'a496 address) store
                  ((church-force (cons 'a497 address) store
                     church-first)
                    (cons 'a498 address) store church-args)))
              '()
              (lambda (address store church-args)
                ((church-force (cons 'a499 address) store
                   church-iota)
                  (cons 'a500 address) store
                  ((church-force (cons 'a501 address) store
                     church-first)
                    (cons 'a502 address) store church-args)))))
           (church-uniform
            ((church-force (cons 'a503 address) store
               church-make-stateless-xrp)
              (cons 'a504 address) store 'uniform
              (lambda (address store church-a church-b)
                ((church-force (cons 'a505 address) store
                   church-+)
                  (cons 'a506 address) store
                  ((church-force (cons 'a507 address) store
                     church-*)
                    (cons 'a508 address) store
                    ((church-force (cons 'a509 address)
                       store church--)
                      (cons 'a510 address) store church-b
                      church-a)
                    ((church-force (cons 'a511 address)
                       store church-random-real)
                      (cons 'a512 address) store))
                  church-a))
              (lambda (address store church-args church-val)
                ((church-force (cons 'a513 address) store
                   (lambda (address store church-a church-b)
                     (if (church-force (cons 'a514 address)
                           store
                           ((church-force
                              (cons 'a515 address) store
                              church-or)
                             (cons 'a516 address) store
                             ((church-force
                                (cons 'a517 address) store
                                church-<)
                               (cons 'a518 address) store
                               church-val church-a)
                             ((church-force
                                (cons 'a519 address) store
                                church->)
                               (cons 'a520 address) store
                               church-val church-b)))
                         -inf.0
                         ((church-force (cons 'a521 address)
                            store church--)
                           (cons 'a522 address) store
                           ((church-force
                              (cons 'a523 address) store
                              church-log)
                             (cons 'a524 address) store
                             ((church-force
                                (cons 'a525 address) store
                                church--)
                               (cons 'a526 address) store
                               church-b church-a))))))
                  (cons 'a527 address) store
                  ((church-force (cons 'a528 address) store
                     church-first)
                    (cons 'a529 address) store church-args)
                  ((church-force (cons 'a530 address) store
                     church-second)
                    (cons 'a531 address) store church-args)))))
           (church-exponential
            ((church-force (cons 'a532 address) store
               church-make-stateless-xrp)
              (cons 'a533 address) store 'exponential
              (lambda (address store church-inv-mean)
                ((church-force (cons 'a534 address) store
                   church--)
                  (cons 'a535 address) store
                  ((church-force (cons 'a536 address) store
                     church-/)
                    (cons 'a537 address) store
                    ((church-force (cons 'a538 address)
                       store church-log)
                      (cons 'a539 address) store
                      ((church-force (cons 'a540 address)
                         store church-random-real)
                        (cons 'a541 address) store))
                    church-inv-mean)))
              (lambda (address store church-args church-val)
                (if (church-force (cons 'a542 address) store
                      ((church-force (cons 'a543 address)
                         store church-<)
                        (cons 'a544 address) store
                        church-val 0))
                    -inf.0
                    ((church-force (cons 'a545 address)
                       store
                       (lambda
                         (address store church-inv-mean)
                         ((church-force (cons 'a546 address)
                            store church-+)
                           (cons 'a547 address) store
                           ((church-force
                              (cons 'a548 address) store
                              church-log)
                             (cons 'a549 address) store
                             church-inv-mean)
                           ((church-force
                              (cons 'a550 address) store
                              church--)
                             (cons 'a551 address) store
                             ((church-force
                                (cons 'a552 address) store
                                church-*)
                               (cons 'a553 address) store
                               church-inv-mean church-val)))))
                      (cons 'a554 address) store
                      ((church-force (cons 'a555 address)
                         store church-first)
                        (cons 'a556 address) store
                        church-args))))))
           (church-gaussian
            ((church-force (cons 'a557 address) store
               church-make-stateless-xrp)
              (cons 'a558 address) store 'gaussian
              (lambda (address store . church-args)
                ((church-force (cons 'a559 address) store
                   church-sample-gaussian)
                  (cons 'a560 address) store
                  ((church-force (cons 'a561 address) store
                     church-first)
                    (cons 'a562 address) store church-args)
                  ((church-force (cons 'a563 address) store
                     church-second)
                    (cons 'a564 address) store church-args)))
              (lambda (address store church-args church-val)
                ((church-force (cons 'a565 address) store
                   church-gaussian-lnpdf)
                  (cons 'a566 address) store church-val
                  ((church-force (cons 'a567 address) store
                     church-first)
                    (cons 'a568 address) store church-args)
                  ((church-force (cons 'a569 address) store
                     church-second)
                    (cons 'a570 address) store church-args)))))
           (church-gensym
            ((church-force (cons 'a571 address) store
               church-make-stateless-xrp)
              (cons 'a572 address) store 'gensym
              (lambda (address store . church-prefix)
                ((church-force (cons 'a573 address) store
                   church-apply)
                  (cons 'a574 address) store
                  church-scheme-gensym church-prefix))
              (lambda (address store church-args church-val)
                ((church-force (cons 'a575 address) store
                   church-log)
                  (cons 'a576 address) store 0.9))))
           (church-random-permutation
            ((church-force (cons 'a577 address) store
               church-make-stateless-xrp)
              (cons 'a578 address) store 'random-permutation
              (lambda (address store church-len)
                (letrec ((church-loop
                          (lambda
                            (address store church-perm
                              church-n)
                            (if (church-force
                                  (cons 'a579 address) store
                                  ((church-force
                                     (cons 'a580 address)
                                     store church-=)
                                    (cons 'a581 address)
                                    store church-n 0))
                                church-perm
                                ((church-force
                                   (cons 'a582 address)
                                   store
                                   (lambda
                                     (address store church-k)
                                     ((church-force
                                        (cons 'a583 address)
                                        store church-loop)
                                       (cons 'a584 address)
                                       store
                                       ((church-force
                                          (cons 'a585
                                            address)
                                          store church-put)
                                         (cons 'a586 address)
                                         store
                                         ((church-force
                                            (cons 'a587
                                              address)
                                            store church-put)
                                           (cons 'a588
                                             address)
                                           store church-perm
                                           church-k
                                           ((church-force
                                              (cons 'a589
                                                address)
                                              store
                                              church-list-ref)
                                             (cons 'a590
                                               address)
                                             store
                                             church-perm
                                             church-n))
                                         church-n
                                         ((church-force
                                            (cons 'a591
                                              address)
                                            store
                                            church-list-ref)
                                           (cons 'a592
                                             address)
                                           store church-perm
                                           church-k))
                                       ((church-force
                                          (cons 'a593
                                            address)
                                          store church--)
                                         (cons 'a594 address)
                                         store church-n 1))))
                                  (cons 'a595 address) store
                                  ((church-force
                                     (cons 'a596 address)
                                     store
                                     church-sample-integer)
                                    (cons 'a597 address)
                                    store
                                    ((church-force
                                       (cons 'a598 address)
                                       store church-+)
                                      (cons 'a599 address)
                                      store church-n 1)))))))
                  ((church-force (cons 'a600 address) store
                     church-loop)
                    (cons 'a601 address) store
                    ((church-force (cons 'a602 address)
                       store church-iota)
                      (cons 'a603 address) store church-len)
                    ((church-force (cons 'a604 address)
                       store church--)
                      (cons 'a605 address) store church-len
                      1))))
              (lambda (address store church-args church-val)
                ((church-force (cons 'a606 address) store
                   (lambda (address store church-len)
                     (if (church-force (cons 'a607 address)
                           store
                           ((church-force
                              (cons 'a608 address) store
                              church-=)
                             (cons 'a609 address) store
                             church-len
                             ((church-force
                                (cons 'a610 address) store
                                church-length)
                               (cons 'a611 address) store
                               church-val)))
                         ((church-force (cons 'a612 address)
                            store church--)
                           (cons 'a613 address) store
                           ((church-force
                              (cons 'a614 address) store
                              church-lnfact)
                             (cons 'a615 address) store
                             church-len))
                         ((church-force (cons 'a616 address)
                            store church-log)
                           (cons 'a617 address) store 0))))
                  (cons 'a618 address) store
                  ((church-force (cons 'a619 address) store
                     church-first)
                    (cons 'a620 address) store church-args)))))
           (church-put
            (lambda
              (address store church-lst church-ind
                church-elt)
              ((church-force (cons 'a621 address) store
                 church-append)
                (cons 'a622 address) store
                ((church-force (cons 'a623 address) store
                   church-take)
                  (cons 'a624 address) store church-lst
                  church-ind)
                ((church-force (cons 'a625 address) store
                   church-list)
                  (cons 'a626 address) store church-elt)
                ((church-force (cons 'a627 address) store
                   church-drop)
                  (cons 'a628 address) store church-lst
                  ((church-force (cons 'a629 address) store
                     church-+)
                    (cons 'a630 address) store 1 church-ind)))))
           (church-permute
            (lambda (address store church-lst)
              ((church-force (cons 'a631 address) store
                 church-map)
                (cons 'a632 address) store
                (lambda (address store church-ind)
                  ((church-force (cons 'a633 address) store
                     church-list-ref)
                    (cons 'a634 address) store church-lst
                    church-ind))
                ((church-force (cons 'a635 address) store
                   church-random-permutation)
                  (cons 'a636 address) store
                  ((church-force (cons 'a637 address) store
                     church-length)
                    (cons 'a638 address) store church-lst)))))
           (church-make-dirichlet-discrete
            (lambda (address store church-hyp)
              ((church-force (cons 'a639 address) store
                 church-make-xrp)
                (cons 'a640 address) store
                'dirichlet-discrete
                (lambda
                  (address store church-stats
                    church-hyperparams church-args)
                  ((church-force (cons 'a641 address) store
                     (lambda (address store church-counts)
                       ((church-force (cons 'a642 address)
                          store
                          (lambda
                            (address store
                              church-total-counts)
                            ((church-force
                               (cons 'a643 address) store
                               (lambda
                                 (address store church-probs)
                                 ((church-force
                                    (cons 'a644 address)
                                    store
                                    (lambda
                                      (address store
                                        church-value)
                                      ((church-force
                                         (cons 'a645 address)
                                         store
                                         (lambda
                                           (address store
                                             church-new-stats)
                                           ((church-force
                                              (cons 'a646
                                                address)
                                              store
                                              church-list)
                                             (cons 'a647
                                               address)
                                             store
                                             church-value
                                             church-new-stats
                                             ((church-force
                                                (cons 'a648
                                                  address)
                                                store
                                                church-log)
                                               (cons 'a649
                                                 address)
                                               store
                                               ((church-force
                                                  (cons
                                                    'a650
                                                    address)
                                                  store
                                                  church-list-ref)
                                                 (cons 'a651
                                                   address)
                                                 store
                                                 church-probs
                                                 church-value)))))
                                        (cons 'a652 address)
                                        store
                                        ((church-force
                                           (cons 'a653
                                             address)
                                           store
                                           church-append)
                                          (cons 'a654
                                            address)
                                          store
                                          ((church-force
                                             (cons 'a655
                                               address)
                                             store
                                             church-take)
                                            (cons 'a656
                                              address)
                                            store
                                            church-stats
                                            church-value)
                                          ((church-force
                                             (cons 'a657
                                               address)
                                             store
                                             church-list)
                                            (cons 'a658
                                              address)
                                            store
                                            ((church-force
                                               (cons 'a659
                                                 address)
                                               store
                                               church-+)
                                              (cons 'a660
                                                address)
                                              store 1
                                              ((church-force
                                                 (cons 'a661
                                                   address)
                                                 store
                                                 church-list-ref)
                                                (cons 'a662
                                                  address)
                                                store
                                                church-stats
                                                church-value)))
                                          ((church-force
                                             (cons 'a663
                                               address)
                                             store
                                             church-drop)
                                            (cons 'a664
                                              address)
                                            store
                                            church-stats
                                            ((church-force
                                               (cons 'a665
                                                 address)
                                               store
                                               church-+)
                                              (cons 'a666
                                                address)
                                              store 1
                                              church-value))))))
                                   (cons 'a667 address)
                                   store
                                   ((church-force
                                      (cons 'a668 address)
                                      store
                                      church-sample-discrete)
                                     (cons 'a669 address)
                                     store church-probs))))
                              (cons 'a670 address) store
                              ((church-force
                                 (cons 'a671 address) store
                                 church-map)
                                (cons 'a672 address) store
                                (lambda
                                  (address store church-c)
                                  ((church-force
                                     (cons 'a673 address)
                                     store church-/)
                                    (cons 'a674 address)
                                    store church-c
                                    church-total-counts))
                                church-counts))))
                         (cons 'a675 address) store
                         ((church-force (cons 'a676 address)
                            store church-apply)
                           (cons 'a677 address) store
                           church-+ church-counts))))
                    (cons 'a678 address) store
                    ((church-force (cons 'a679 address)
                       store church-map)
                      (cons 'a680 address) store church-+
                      church-stats church-hyperparams)))
                (lambda
                  (address store church-value church-stats
                    church-hyperparams church-args)
                  ((church-force (cons 'a681 address) store
                     church-list)
                    (cons 'a682 address) store church-value
                    ((church-force (cons 'a683 address)
                       store church-append)
                      (cons 'a684 address) store
                      ((church-force (cons 'a685 address)
                         store church-take)
                        (cons 'a686 address) store
                        church-stats church-value)
                      ((church-force (cons 'a687 address)
                         store church-list)
                        (cons 'a688 address) store
                        ((church-force (cons 'a689 address)
                           store church-+)
                          (cons 'a690 address) store
                          ((church-force
                             (cons 'a691 address) store
                             church-list-ref)
                            (cons 'a692 address) store
                            church-stats church-value)
                          1))
                      ((church-force (cons 'a693 address)
                         store church-drop)
                        (cons 'a694 address) store
                        church-stats
                        ((church-force (cons 'a695 address)
                           store church-+)
                          (cons 'a696 address) store 1
                          church-value)))
                    ((church-force (cons 'a697 address)
                       store church--)
                      (cons 'a698 address) store
                      ((church-force (cons 'a699 address)
                         store church-log)
                        (cons 'a700 address) store
                        ((church-force (cons 'a701 address)
                           store church-+)
                          (cons 'a702 address) store
                          ((church-force
                             (cons 'a703 address) store
                             church-list-ref)
                            (cons 'a704 address) store
                            church-stats church-value)
                          ((church-force
                             (cons 'a705 address) store
                             church-list-ref)
                            (cons 'a706 address) store
                            church-hyperparams church-value)))
                      ((church-force (cons 'a707 address)
                         store church-log)
                        (cons 'a708 address) store
                        ((church-force (cons 'a709 address)
                           store church-+)
                          (cons 'a710 address) store
                          ((church-force
                             (cons 'a711 address) store
                             church-apply)
                            (cons 'a712 address) store
                            church-+ church-stats)
                          ((church-force
                             (cons 'a713 address) store
                             church-apply)
                            (cons 'a714 address) store
                            church-+ church-hyperparams))))))
                (lambda
                  (address store church-value church-stats
                    church-hyperparams church-args)
                  ((church-force (cons 'a715 address) store
                     church-list)
                    (cons 'a716 address) store church-value
                    ((church-force (cons 'a717 address)
                       store church-append)
                      (cons 'a718 address) store
                      ((church-force (cons 'a719 address)
                         store church-take)
                        (cons 'a720 address) store
                        church-stats church-value)
                      ((church-force (cons 'a721 address)
                         store church-list)
                        (cons 'a722 address) store
                        ((church-force (cons 'a723 address)
                           store church--)
                          (cons 'a724 address) store
                          ((church-force
                             (cons 'a725 address) store
                             church-list-ref)
                            (cons 'a726 address) store
                            church-stats church-value)
                          1))
                      ((church-force (cons 'a727 address)
                         store church-drop)
                        (cons 'a728 address) store
                        church-stats
                        ((church-force (cons 'a729 address)
                           store church-+)
                          (cons 'a730 address) store 1
                          church-value)))
                    ((church-force (cons 'a731 address)
                       store church-+)
                      (cons 'a732 address) store
                      ((church-force (cons 'a733 address)
                         store church-log)
                        (cons 'a734 address) store
                        ((church-force (cons 'a735 address)
                           store church-+)
                          (cons 'a736 address) store -1
                          ((church-force
                             (cons 'a737 address) store
                             church-list-ref)
                            (cons 'a738 address) store
                            church-stats church-value)
                          ((church-force
                             (cons 'a739 address) store
                             church-list-ref)
                            (cons 'a740 address) store
                            church-hyperparams church-value)))
                      ((church-force (cons 'a741 address)
                         store church--)
                        (cons 'a742 address) store
                        ((church-force (cons 'a743 address)
                           store church-log)
                          (cons 'a744 address) store
                          ((church-force
                             (cons 'a745 address) store
                             church-+)
                            (cons 'a746 address) store -1
                            ((church-force
                               (cons 'a747 address) store
                               church-apply)
                              (cons 'a748 address) store
                              church-+ church-stats)
                            ((church-force
                               (cons 'a749 address) store
                               church-apply)
                              (cons 'a750 address) store
                              church-+ church-hyperparams)))))))
                'dirichlet-discrete-scorer
                ((church-force (cons 'a751 address) store
                   church-make-list)
                  (cons 'a752 address) store
                  ((church-force (cons 'a753 address) store
                     church-length)
                    (cons 'a754 address) store church-hyp)
                  0.0)
                church-hyp '()
                (lambda
                  (address store church-stats
                    church-hyperparams church-args)
                  ((church-force (cons 'a755 address) store
                     church-iota)
                    (cons 'a756 address) store
                    ((church-force (cons 'a757 address)
                       store church-length)
                      (cons 'a758 address) store
                      church-hyperparams))))))
           (church-make-beta-binomial
            (lambda (address store church-alpha church-beta)
              ((church-force (cons 'a759 address) store
                 (lambda (address store church-dd)
                   (lambda (address store)
                     ((church-force (cons 'a760 address)
                        store church-=)
                       (cons 'a761 address) store
                       ((church-force (cons 'a762 address)
                          store church-dd)
                         (cons 'a763 address) store)
                       1))))
                (cons 'a764 address) store
                ((church-force (cons 'a765 address) store
                   church-make-dirichlet-discrete)
                  (cons 'a766 address) store
                  ((church-force (cons 'a767 address) store
                     church-list)
                    (cons 'a768 address) store church-alpha
                    church-beta)))))
           (church-make-symmetric-dirichlet-discrete
            (lambda (address store church-N church-hyp)
              ((church-force (cons 'a769 address) store
                 church-make-dirichlet-discrete)
                (cons 'a770 address) store
                ((church-force (cons 'a771 address) store
                   church-make-list)
                  (cons 'a772 address) store church-N
                  church-hyp))))
           (church-make-CRP
            (lambda (address store church-alpha)
              ((church-force (cons 'a773 address) store
                 church-make-xrp)
                (cons 'a774 address) store 'CRP
                (lambda
                  (address store church-stats
                    church-hyperparam church-args)
                  ((church-force (cons 'a775 address) store
                     (lambda
                       (address store church-count-map)
                       ((church-force (cons 'a776 address)
                          store
                          (lambda
                            (address store church-counts)
                            ((church-force
                               (cons 'a777 address) store
                               (lambda
                                 (address store
                                   church-total-counts)
                                 ((church-force
                                    (cons 'a778 address)
                                    store
                                    (lambda
                                      (address store
                                        church-probs)
                                      ((church-force
                                         (cons 'a779 address)
                                         store
                                         (lambda
                                           (address store
                                             church-table-index)
                                           (if (church-force
                                                 (cons 'a780
                                                   address)
                                                 store
                                                 ((church-force
                                                    (cons
                                                      'a781
                                                      address)
                                                    store
                                                    church-=)
                                                   (cons
                                                     'a782
                                                     address)
                                                   store
                                                   church-table-index
                                                   0))
                                               ((church-force
                                                  (cons
                                                    'a783
                                                    address)
                                                  store
                                                  (lambda
                                                    (address
                                                      store
                                                      church-table-symbol)
                                                    ((church-force
                                                       (cons
                                                         'a784
                                                         address)
                                                       store
                                                       (lambda
                                                         (address
                                                           store
                                                           church-new-count-map)
                                                         ((church-force
                                                            (cons
                                                              'a785
                                                              address)
                                                            store
                                                            church-list)
                                                           (cons
                                                             'a786
                                                             address)
                                                           store
                                                           church-table-symbol
                                                           church-new-count-map
                                                           ((church-force
                                                              (cons
                                                                'a787
                                                                address)
                                                              store
                                                              church-list-ref)
                                                             (cons
                                                               'a788
                                                               address)
                                                             store
                                                             church-probs
                                                             church-table-index))))
                                                      (cons
                                                        'a789
                                                        address)
                                                      store
                                                      ((church-force
                                                         (cons
                                                           'a790
                                                           address)
                                                         store
                                                         church-pair)
                                                        (cons
                                                          'a791
                                                          address)
                                                        store
                                                        ((church-force
                                                           (cons
                                                             'a792
                                                             address)
                                                           store
                                                           church-pair)
                                                          (cons
                                                            'a793
                                                            address)
                                                          store
                                                          church-table-symbol
                                                          1)
                                                        church-count-map))))
                                                 (cons 'a794
                                                   address)
                                                 store
                                                 ((church-force
                                                    (cons
                                                      'a795
                                                      address)
                                                    store
                                                    church-gensym)
                                                   (cons
                                                     'a796
                                                     address)
                                                   store))
                                               ((church-force
                                                  (cons
                                                    'a797
                                                    address)
                                                  store
                                                  (lambda
                                                    (address
                                                      store
                                                      church-table-symbol)
                                                    ((church-force
                                                       (cons
                                                         'a798
                                                         address)
                                                       store
                                                       (lambda
                                                         (address
                                                           store
                                                           church-table-count)
                                                         ((church-force
                                                            (cons
                                                              'a799
                                                              address)
                                                            store
                                                            (lambda
                                                              (address
                                                                store
                                                                church-new-count-map)
                                                              ((church-force
                                                                 (cons
                                                                   'a800
                                                                   address)
                                                                 store
                                                                 church-list)
                                                                (cons
                                                                  'a801
                                                                  address)
                                                                store
                                                                church-table-symbol
                                                                church-new-count-map
                                                                ((church-force
                                                                   (cons
                                                                     'a802
                                                                     address)
                                                                   store
                                                                   church-list-ref)
                                                                  (cons
                                                                    'a803
                                                                    address)
                                                                  store
                                                                  church-probs
                                                                  church-table-index))))
                                                           (cons
                                                             'a804
                                                             address)
                                                           store
                                                           ((church-force
                                                              (cons
                                                                'a805
                                                                address)
                                                              store
                                                              church-append)
                                                             (cons
                                                               'a806
                                                               address)
                                                             store
                                                             ((church-force
                                                                (cons
                                                                  'a807
                                                                  address)
                                                                store
                                                                church-take)
                                                               (cons
                                                                 'a808
                                                                 address)
                                                               store
                                                               church-count-map
                                                               ((church-force
                                                                  (cons
                                                                    'a809
                                                                    address)
                                                                  store
                                                                  church--)
                                                                 (cons
                                                                   'a810
                                                                   address)
                                                                 store
                                                                 church-table-index
                                                                 1))
                                                             ((church-force
                                                                (cons
                                                                  'a811
                                                                  address)
                                                                store
                                                                church-list)
                                                               (cons
                                                                 'a812
                                                                 address)
                                                               store
                                                               ((church-force
                                                                  (cons
                                                                    'a813
                                                                    address)
                                                                  store
                                                                  church-pair)
                                                                 (cons
                                                                   'a814
                                                                   address)
                                                                 store
                                                                 church-table-symbol
                                                                 church-table-count))
                                                             ((church-force
                                                                (cons
                                                                  'a815
                                                                  address)
                                                                store
                                                                church-drop)
                                                               (cons
                                                                 'a816
                                                                 address)
                                                               store
                                                               church-count-map
                                                               church-table-index)))))
                                                      (cons
                                                        'a817
                                                        address)
                                                      store
                                                      ((church-force
                                                         (cons
                                                           'a818
                                                           address)
                                                         store
                                                         church-+)
                                                        (cons
                                                          'a819
                                                          address)
                                                        store
                                                        1
                                                        ((church-force
                                                           (cons
                                                             'a820
                                                             address)
                                                           store
                                                           church-rest)
                                                          (cons
                                                            'a821
                                                            address)
                                                          store
                                                          ((church-force
                                                             (cons
                                                               'a822
                                                               address)
                                                             store
                                                             church-list-ref)
                                                            (cons
                                                              'a823
                                                              address)
                                                            store
                                                            church-count-map
                                                            ((church-force
                                                               (cons
                                                                 'a824
                                                                 address)
                                                               store
                                                               church--)
                                                              (cons
                                                                'a825
                                                                address)
                                                              store
                                                              church-table-index
                                                              1)))))))
                                                 (cons 'a826
                                                   address)
                                                 store
                                                 ((church-force
                                                    (cons
                                                      'a827
                                                      address)
                                                    store
                                                    church-first)
                                                   (cons
                                                     'a828
                                                     address)
                                                   store
                                                   ((church-force
                                                      (cons
                                                        'a829
                                                        address)
                                                      store
                                                      church-list-ref)
                                                     (cons
                                                       'a830
                                                       address)
                                                     store
                                                     church-count-map
                                                     ((church-force
                                                        (cons
                                                          'a831
                                                          address)
                                                        store
                                                        church--)
                                                       (cons
                                                         'a832
                                                         address)
                                                       store
                                                       church-table-index
                                                       1)))))))
                                        (cons 'a833 address)
                                        store
                                        ((church-force
                                           (cons 'a834
                                             address)
                                           store
                                           church-sample-discrete)
                                          (cons 'a835
                                            address)
                                          store church-probs))))
                                   (cons 'a836 address)
                                   store
                                   ((church-force
                                      (cons 'a837 address)
                                      store church-map)
                                     (cons 'a838 address)
                                     store
                                     (lambda
                                       (address store
                                         church-c)
                                       ((church-force
                                          (cons 'a839
                                            address)
                                          store church-/)
                                         (cons 'a840 address)
                                         store church-c
                                         church-total-counts))
                                     church-counts))))
                              (cons 'a841 address) store
                              ((church-force
                                 (cons 'a842 address) store
                                 church-apply)
                                (cons 'a843 address) store
                                church-+ church-counts))))
                         (cons 'a844 address) store
                         ((church-force (cons 'a845 address)
                            store church-pair)
                           (cons 'a846 address) store
                           church-hyperparam
                           ((church-force
                              (cons 'a847 address) store
                              church-map)
                             (cons 'a848 address) store
                             church-rest church-count-map)))))
                    (cons 'a849 address) store church-stats))
                (lambda
                  (address store church-value church-stats
                    church-hyperparam church-args)
                  ((church-force (cons 'a850 address) store
                     (lambda
                       (address store church-count-map)
                       ((church-force (cons 'a851 address)
                          store
                          (lambda
                            (address store church-counts)
                            ((church-force
                               (cons 'a852 address) store
                               (lambda
                                 (address store
                                   church-total-counts)
                                 ((church-force
                                    (cons 'a853 address)
                                    store
                                    (lambda
                                      (address store
                                        church-probs)
                                      ((church-force
                                         (cons 'a854 address)
                                         store
                                         (lambda
                                           (address store
                                             church-table-index)
                                           (if (church-force
                                                 (cons 'a855
                                                   address)
                                                 store
                                                 ((church-force
                                                    (cons
                                                      'a856
                                                      address)
                                                    store
                                                    church-eq?)
                                                   (cons
                                                     'a857
                                                     address)
                                                   store
                                                   church-false
                                                   church-table-index))
                                               ((church-force
                                                  (cons
                                                    'a858
                                                    address)
                                                  store
                                                  church-list)
                                                 (cons 'a859
                                                   address)
                                                 store
                                                 church-value
                                                 ((church-force
                                                    (cons
                                                      'a860
                                                      address)
                                                    store
                                                    church-pair)
                                                   (cons
                                                     'a861
                                                     address)
                                                   store
                                                   ((church-force
                                                      (cons
                                                        'a862
                                                        address)
                                                      store
                                                      church-pair)
                                                     (cons
                                                       'a863
                                                       address)
                                                     store
                                                     church-value
                                                     1)
                                                   church-count-map)
                                                 ((church-force
                                                    (cons
                                                      'a864
                                                      address)
                                                    store
                                                    church-list-ref)
                                                   (cons
                                                     'a865
                                                     address)
                                                   store
                                                   church-probs
                                                   0))
                                               ((church-force
                                                  (cons
                                                    'a866
                                                    address)
                                                  store
                                                  (lambda
                                                    (address
                                                      store
                                                      church-table-count)
                                                    ((church-force
                                                       (cons
                                                         'a867
                                                         address)
                                                       store
                                                       (lambda
                                                         (address
                                                           store
                                                           church-new-table-count)
                                                         ((church-force
                                                            (cons
                                                              'a868
                                                              address)
                                                            store
                                                            (lambda
                                                              (address
                                                                store
                                                                church-new-count-map)
                                                              ((church-force
                                                                 (cons
                                                                   'a869
                                                                   address)
                                                                 store
                                                                 church-list)
                                                                (cons
                                                                  'a870
                                                                  address)
                                                                store
                                                                church-value
                                                                church-new-count-map
                                                                ((church-force
                                                                   (cons
                                                                     'a871
                                                                     address)
                                                                   store
                                                                   church-list-ref)
                                                                  (cons
                                                                    'a872
                                                                    address)
                                                                  store
                                                                  church-probs
                                                                  church-table-index))))
                                                           (cons
                                                             'a873
                                                             address)
                                                           store
                                                           ((church-force
                                                              (cons
                                                                'a874
                                                                address)
                                                              store
                                                              church-append)
                                                             (cons
                                                               'a875
                                                               address)
                                                             store
                                                             ((church-force
                                                                (cons
                                                                  'a876
                                                                  address)
                                                                store
                                                                church-take)
                                                               (cons
                                                                 'a877
                                                                 address)
                                                               store
                                                               church-count-map
                                                               church-table-index)
                                                             ((church-force
                                                                (cons
                                                                  'a878
                                                                  address)
                                                                store
                                                                church-list)
                                                               (cons
                                                                 'a879
                                                                 address)
                                                               store
                                                               ((church-force
                                                                  (cons
                                                                    'a880
                                                                    address)
                                                                  store
                                                                  church-pair)
                                                                 (cons
                                                                   'a881
                                                                   address)
                                                                 store
                                                                 church-value
                                                                 church-new-table-count))
                                                             ((church-force
                                                                (cons
                                                                  'a882
                                                                  address)
                                                                store
                                                                church-drop)
                                                               (cons
                                                                 'a883
                                                                 address)
                                                               store
                                                               church-count-map
                                                               ((church-force
                                                                  (cons
                                                                    'a884
                                                                    address)
                                                                  store
                                                                  church-+)
                                                                 (cons
                                                                   'a885
                                                                   address)
                                                                 store
                                                                 1
                                                                 church-table-index))))))
                                                      (cons
                                                        'a886
                                                        address)
                                                      store
                                                      ((church-force
                                                         (cons
                                                           'a887
                                                           address)
                                                         store
                                                         church-+)
                                                        (cons
                                                          'a888
                                                          address)
                                                        store
                                                        church-table-count
                                                        1))))
                                                 (cons 'a889
                                                   address)
                                                 store
                                                 ((church-force
                                                    (cons
                                                      'a890
                                                      address)
                                                    store
                                                    church-rest)
                                                   (cons
                                                     'a891
                                                     address)
                                                   store
                                                   ((church-force
                                                      (cons
                                                        'a892
                                                        address)
                                                      store
                                                      church-list-ref)
                                                     (cons
                                                       'a893
                                                       address)
                                                     store
                                                     church-count-map
                                                     church-table-index))))))
                                        (cons 'a894 address)
                                        store
                                        ((church-force
                                           (cons 'a895
                                             address)
                                           store
                                           church-list-index)
                                          (cons 'a896
                                            address)
                                          store
                                          (lambda
                                            (address store
                                              church-c)
                                            ((church-force
                                               (cons 'a897
                                                 address)
                                               store
                                               church-eq?)
                                              (cons 'a898
                                                address)
                                              store
                                              church-value
                                              ((church-force
                                                 (cons 'a899
                                                   address)
                                                 store
                                                 church-first)
                                                (cons 'a900
                                                  address)
                                                store
                                                church-c)))
                                          church-count-map))))
                                   (cons 'a901 address)
                                   store
                                   ((church-force
                                      (cons 'a902 address)
                                      store church-map)
                                     (cons 'a903 address)
                                     store
                                     (lambda
                                       (address store
                                         church-c)
                                       ((church-force
                                          (cons 'a904
                                            address)
                                          store church-/)
                                         (cons 'a905 address)
                                         store church-c
                                         church-total-counts))
                                     church-counts))))
                              (cons 'a906 address) store
                              ((church-force
                                 (cons 'a907 address) store
                                 church-apply)
                                (cons 'a908 address) store
                                church-+ church-counts))))
                         (cons 'a909 address) store
                         ((church-force (cons 'a910 address)
                            store church-pair)
                           (cons 'a911 address) store
                           church-hyperparam
                           ((church-force
                              (cons 'a912 address) store
                              church-map)
                             (cons 'a913 address) store
                             church-rest church-count-map)))))
                    (cons 'a914 address) store church-stats))
                (lambda
                  (address store church-value church-stats
                    church-hyperparam church-args)
                  ((church-force (cons 'a915 address) store
                     (lambda
                       (address store church-count-map)
                       ((church-force (cons 'a916 address)
                          store
                          (lambda
                            (address store church-counts)
                            ((church-force
                               (cons 'a917 address) store
                               (lambda
                                 (address store
                                   church-table-index)
                                 (if (church-force
                                       (cons 'a918 address)
                                       store
                                       ((church-force
                                          (cons 'a919
                                            address)
                                          store church-eq?)
                                         (cons 'a920 address)
                                         store church-false
                                         church-table-index))
                                     ((church-force
                                        (cons 'a921 address)
                                        store church-error)
                                       (cons 'a922 address)
                                       store
                                       church-table-index
                                       "can't decr a value from CRP that doesn't label any table!")
                                     ((church-force
                                        (cons 'a923 address)
                                        store
                                        (lambda
                                          (address store
                                            church-table-count)
                                          ((church-force
                                             (cons 'a924
                                               address)
                                             store
                                             (lambda
                                               (address
                                                 store
                                                 church-new-table-count)
                                               ((church-force
                                                  (cons
                                                    'a925
                                                    address)
                                                  store
                                                  (lambda
                                                    (address
                                                      store
                                                      church-new-count-map)
                                                    ((church-force
                                                       (cons
                                                         'a926
                                                         address)
                                                       store
                                                       church-list)
                                                      (cons
                                                        'a927
                                                        address)
                                                      store
                                                      church-value
                                                      church-new-count-map
                                                      (if (church-force
                                                            (cons
                                                              'a928
                                                              address)
                                                            store
                                                            ((church-force
                                                               (cons
                                                                 'a929
                                                                 address)
                                                               store
                                                               church-=)
                                                              (cons
                                                                'a930
                                                                address)
                                                              store
                                                              0
                                                              church-new-table-count))
                                                          ((church-force
                                                             (cons
                                                               'a931
                                                               address)
                                                             store
                                                             church-/)
                                                            (cons
                                                              'a932
                                                              address)
                                                            store
                                                            church-hyperparam
                                                            ((church-force
                                                               (cons
                                                                 'a933
                                                                 address)
                                                               store
                                                               church-+)
                                                              (cons
                                                                'a934
                                                                address)
                                                              store
                                                              church-hyperparam
                                                              ((church-force
                                                                 (cons
                                                                   'a935
                                                                   address)
                                                                 store
                                                                 church-apply)
                                                                (cons
                                                                  'a936
                                                                  address)
                                                                store
                                                                church-+
                                                                church-counts)
                                                              ((church-force
                                                                 (cons
                                                                   'a937
                                                                   address)
                                                                 store
                                                                 church--)
                                                                (cons
                                                                  'a938
                                                                  address)
                                                                store
                                                                1)))
                                                          ((church-force
                                                             (cons
                                                               'a939
                                                               address)
                                                             store
                                                             church-/)
                                                            (cons
                                                              'a940
                                                              address)
                                                            store
                                                            church-new-table-count
                                                            ((church-force
                                                               (cons
                                                                 'a941
                                                                 address)
                                                               store
                                                               church-+)
                                                              (cons
                                                                'a942
                                                                address)
                                                              store
                                                              church-hyperparam
                                                              ((church-force
                                                                 (cons
                                                                   'a943
                                                                   address)
                                                                 store
                                                                 church-apply)
                                                                (cons
                                                                  'a944
                                                                  address)
                                                                store
                                                                church-+
                                                                church-counts)
                                                              ((church-force
                                                                 (cons
                                                                   'a945
                                                                   address)
                                                                 store
                                                                 church--)
                                                                (cons
                                                                  'a946
                                                                  address)
                                                                store
                                                                1)))))))
                                                 (cons 'a947
                                                   address)
                                                 store
                                                 (if (church-force
                                                       (cons
                                                         'a948
                                                         address)
                                                       store
                                                       ((church-force
                                                          (cons
                                                            'a949
                                                            address)
                                                          store
                                                          church-=)
                                                         (cons
                                                           'a950
                                                           address)
                                                         store
                                                         0
                                                         church-new-table-count))
                                                     ((church-force
                                                        (cons
                                                          'a951
                                                          address)
                                                        store
                                                        church-append)
                                                       (cons
                                                         'a952
                                                         address)
                                                       store
                                                       ((church-force
                                                          (cons
                                                            'a953
                                                            address)
                                                          store
                                                          church-take)
                                                         (cons
                                                           'a954
                                                           address)
                                                         store
                                                         church-count-map
                                                         church-table-index)
                                                       ((church-force
                                                          (cons
                                                            'a955
                                                            address)
                                                          store
                                                          church-drop)
                                                         (cons
                                                           'a956
                                                           address)
                                                         store
                                                         church-count-map
                                                         ((church-force
                                                            (cons
                                                              'a957
                                                              address)
                                                            store
                                                            church-+)
                                                           (cons
                                                             'a958
                                                             address)
                                                           store
                                                           1
                                                           church-table-index)))
                                                     ((church-force
                                                        (cons
                                                          'a959
                                                          address)
                                                        store
                                                        church-append)
                                                       (cons
                                                         'a960
                                                         address)
                                                       store
                                                       ((church-force
                                                          (cons
                                                            'a961
                                                            address)
                                                          store
                                                          church-take)
                                                         (cons
                                                           'a962
                                                           address)
                                                         store
                                                         church-count-map
                                                         church-table-index)
                                                       ((church-force
                                                          (cons
                                                            'a963
                                                            address)
                                                          store
                                                          church-list)
                                                         (cons
                                                           'a964
                                                           address)
                                                         store
                                                         ((church-force
                                                            (cons
                                                              'a965
                                                              address)
                                                            store
                                                            church-pair)
                                                           (cons
                                                             'a966
                                                             address)
                                                           store
                                                           church-value
                                                           church-new-table-count))
                                                       ((church-force
                                                          (cons
                                                            'a967
                                                            address)
                                                          store
                                                          church-drop)
                                                         (cons
                                                           'a968
                                                           address)
                                                         store
                                                         church-count-map
                                                         ((church-force
                                                            (cons
                                                              'a969
                                                              address)
                                                            store
                                                            church-+)
                                                           (cons
                                                             'a970
                                                             address)
                                                           store
                                                           1
                                                           church-table-index)))))))
                                            (cons 'a971
                                              address)
                                            store
                                            ((church-force
                                               (cons 'a972
                                                 address)
                                               store
                                               church--)
                                              (cons 'a973
                                                address)
                                              store
                                              church-table-count
                                              1))))
                                       (cons 'a974 address)
                                       store
                                       ((church-force
                                          (cons 'a975
                                            address)
                                          store church-rest)
                                         (cons 'a976 address)
                                         store
                                         ((church-force
                                            (cons 'a977
                                              address)
                                            store
                                            church-list-ref)
                                           (cons 'a978
                                             address)
                                           store
                                           church-count-map
                                           church-table-index))))))
                              (cons 'a979 address) store
                              ((church-force
                                 (cons 'a980 address) store
                                 church-list-index)
                                (cons 'a981 address) store
                                (lambda
                                  (address store church-c)
                                  ((church-force
                                     (cons 'a982 address)
                                     store church-eq?)
                                    (cons 'a983 address)
                                    store church-value
                                    ((church-force
                                       (cons 'a984 address)
                                       store church-first)
                                      (cons 'a985 address)
                                      store church-c)))
                                church-count-map))))
                         (cons 'a986 address) store
                         ((church-force (cons 'a987 address)
                            store church-map)
                           (cons 'a988 address) store
                           church-rest church-count-map))))
                    (cons 'a989 address) store church-stats))
                'CRP-scorer '() church-alpha '() '())))
           (church-DPmem
            (lambda (address store church-alpha church-proc)
              ((church-force (cons 'a990 address) store
                 (lambda
                   (address store church-augmented-proc
                     church-crps)
                   (lambda (address store . church-argsin)
                     ((church-force (cons 'a991 address)
                        store church-augmented-proc)
                       (cons 'a992 address) store
                       church-argsin
                       ((church-force (cons 'a993 address)
                          store
                          ((church-force
                             (cons 'a994 address) store
                             church-crps)
                            (cons 'a995 address) store
                            church-argsin))
                         (cons 'a996 address) store)))))
                (cons 'a997 address) store
                ((lambda (mem-address store proc)
                   (lambda (address store . args)
                     (church-apply (cons args mem-address)
                       store proc args)))
                  address store
                  (lambda
                    (address store church-args church-part)
                    ((church-force (cons 'a998 address)
                       store church-apply)
                      (cons 'a999 address) store church-proc
                      church-args)))
                ((lambda (mem-address store proc)
                   (lambda (address store . args)
                     (church-apply (cons args mem-address)
                       store proc args)))
                  address store
                  (lambda (address store church-args)
                    ((church-force (cons 'a1000 address)
                       store church-make-CRP)
                      (cons 'a1001 address) store
                      church-alpha))))))
           (church-update->state church-first)
           (church-update->cd-bw/fw church-second)
           (church-proposable-xrps
            (lambda
              (address store church-state church-proposable?)
              ((church-force (cons 'a1002 address) store
                 church-filter-map)
                (cons 'a1003 address) store
                (lambda (address store church-v)
                  (if (church-force (cons 'a1004 address)
                        store
                        ((church-force (cons 'a1005 address)
                           store church-proposable?)
                          (cons 'a1006 address) store
                          ((church-force
                             (cons 'a1007 address) store
                             church-rest)
                            (cons 'a1008 address) store
                            church-v)))
                      ((church-force (cons 'a1009 address)
                         store church-rest)
                        (cons 'a1010 address) store church-v)
                      #f))
                ((church-force (cons 'a1011 address) store
                   church-addbox->alist)
                  (cons 'a1012 address) store
                  ((church-force (cons 'a1013 address) store
                     church-mcmc-state->xrp-draws)
                    (cons 'a1014 address) store church-state)))))
           (church-selective-proposal-distribution
            (lambda
              (address store church-state
                church-normal-form-proc church-proposable?)
              (if (church-force (cons 'a1015 address) store
                    ((church-force (cons 'a1016 address)
                       store church-addbox-empty?)
                      (cons 'a1017 address) store
                      ((church-force (cons 'a1018 address)
                         store church-mcmc-state->xrp-draws)
                        (cons 'a1019 address) store
                        church-state)))
                  ((church-force (cons 'a1020 address) store
                     church-list)
                    (cons 'a1021 address) store 0.0
                    church-state)
                  ((church-force (cons 'a1022 address) store
                     (lambda
                       (address store church-proposal-xrps)
                       (if (church-force
                             (cons 'a1023 address) store
                             ((church-force
                                (cons 'a1024 address) store
                                church-null?)
                               (cons 'a1025 address) store
                               church-proposal-xrps))
                           ((church-force
                              (cons 'a1026 address) store
                              church-list)
                             (cons 'a1027 address) store 0.0
                             church-state)
                           ((church-force
                              (cons 'a1028 address) store
                              (lambda
                                (address store
                                  church-chosen-xrp)
                                ((church-force
                                   (cons 'a1029 address)
                                   store
                                   (lambda
                                     (address store
                                       church-ret1)
                                     ((church-force
                                        (cons 'a1030 address)
                                        store
                                        (lambda
                                          (address store
                                            church-proposed-val)
                                          ((church-force
                                             (cons 'a1031
                                               address)
                                             store
                                             (lambda
                                               (address
                                                 store
                                                 church-proposal-fw-score)
                                               ((church-force
                                                  (cons
                                                    'a1032
                                                    address)
                                                  store
                                                  (lambda
                                                    (address
                                                      store
                                                      church-proposal-bw-score)
                                                    ((church-force
                                                       (cons
                                                         'a1033
                                                         address)
                                                       store
                                                       (lambda
                                                         (address
                                                           store
                                                           church-ret2)
                                                         ((church-force
                                                            (cons
                                                              'a1034
                                                              address)
                                                            store
                                                            (lambda
                                                              (address
                                                                store
                                                                church-proposal-state)
                                                              ((church-force
                                                                 (cons
                                                                   'a1035
                                                                   address)
                                                                 store
                                                                 (lambda
                                                                   (address
                                                                     store
                                                                     church-cd-bw/fw)
                                                                   ((church-force
                                                                      (cons
                                                                        'a1036
                                                                        address)
                                                                      store
                                                                      (lambda
                                                                        (address
                                                                          store
                                                                          church-ind-fw)
                                                                        ((church-force
                                                                           (cons
                                                                             'a1037
                                                                             address)
                                                                           store
                                                                           (lambda
                                                                             (address
                                                                               store
                                                                               church-ind-bw)
                                                                             ((church-force
                                                                                (cons
                                                                                  'a1038
                                                                                  address)
                                                                                store
                                                                                church-list)
                                                                               (cons
                                                                                 'a1039
                                                                                 address)
                                                                               store
                                                                               ((church-force
                                                                                  (cons
                                                                                    'a1040
                                                                                    address)
                                                                                  store
                                                                                  church-+)
                                                                                 (cons
                                                                                   'a1041
                                                                                   address)
                                                                                 store
                                                                                 ((church-force
                                                                                    (cons
                                                                                      'a1042
                                                                                      address)
                                                                                    store
                                                                                    church--)
                                                                                   (cons
                                                                                     'a1043
                                                                                     address)
                                                                                   store
                                                                                   church-proposal-bw-score
                                                                                   church-proposal-fw-score)
                                                                                 church-cd-bw/fw
                                                                                 ((church-force
                                                                                    (cons
                                                                                      'a1044
                                                                                      address)
                                                                                    store
                                                                                    church--)
                                                                                   (cons
                                                                                     'a1045
                                                                                     address)
                                                                                   store
                                                                                   church-ind-bw
                                                                                   church-ind-fw))
                                                                               church-proposal-state)))
                                                                          (cons
                                                                            'a1046
                                                                            address)
                                                                          store
                                                                          ((church-force
                                                                             (cons
                                                                               'a1047
                                                                               address)
                                                                             store
                                                                             church--)
                                                                            (cons
                                                                              'a1048
                                                                              address)
                                                                            store
                                                                            ((church-force
                                                                               (cons
                                                                                 'a1049
                                                                                 address)
                                                                               store
                                                                               church-log)
                                                                              (cons
                                                                                'a1050
                                                                                address)
                                                                              store
                                                                              ((church-force
                                                                                 (cons
                                                                                   'a1051
                                                                                   address)
                                                                                 store
                                                                                 church-length)
                                                                                (cons
                                                                                  'a1052
                                                                                  address)
                                                                                store
                                                                                ((church-force
                                                                                   (cons
                                                                                     'a1053
                                                                                     address)
                                                                                   store
                                                                                   church-proposable-xrps)
                                                                                  (cons
                                                                                    'a1054
                                                                                    address)
                                                                                  store
                                                                                  church-proposal-state
                                                                                  church-proposable?)))))))
                                                                     (cons
                                                                       'a1055
                                                                       address)
                                                                     store
                                                                     ((church-force
                                                                        (cons
                                                                          'a1056
                                                                          address)
                                                                        store
                                                                        church--)
                                                                       (cons
                                                                         'a1057
                                                                         address)
                                                                       store
                                                                       ((church-force
                                                                          (cons
                                                                            'a1058
                                                                            address)
                                                                          store
                                                                          church-log)
                                                                         (cons
                                                                           'a1059
                                                                           address)
                                                                         store
                                                                         ((church-force
                                                                            (cons
                                                                              'a1060
                                                                              address)
                                                                            store
                                                                            church-length)
                                                                           (cons
                                                                             'a1061
                                                                             address)
                                                                           store
                                                                           church-proposal-xrps))))))
                                                                (cons
                                                                  'a1062
                                                                  address)
                                                                store
                                                                ((church-force
                                                                   (cons
                                                                     'a1063
                                                                     address)
                                                                   store
                                                                   church-update->cd-bw/fw)
                                                                  (cons
                                                                    'a1064
                                                                    address)
                                                                  store
                                                                  church-ret2))))
                                                           (cons
                                                             'a1065
                                                             address)
                                                           store
                                                           ((church-force
                                                              (cons
                                                                'a1066
                                                                address)
                                                              store
                                                              church-update->state)
                                                             (cons
                                                               'a1067
                                                               address)
                                                             store
                                                             church-ret2))))
                                                      (cons
                                                        'a1068
                                                        address)
                                                      store
                                                      ((church-force
                                                         (cons
                                                           'a1069
                                                           address)
                                                         store
                                                         church-counterfactual-update)
                                                        (cons
                                                          'a1070
                                                          address)
                                                        store
                                                        church-state
                                                        church-normal-form-proc
                                                        ((church-force
                                                           (cons
                                                             'a1071
                                                             address)
                                                           store
                                                           church-pair)
                                                          (cons
                                                            'a1072
                                                            address)
                                                          store
                                                          church-chosen-xrp
                                                          church-proposed-val)))))
                                                 (cons
                                                   'a1073
                                                   address)
                                                 store
                                                 ((church-force
                                                    (cons
                                                      'a1074
                                                      address)
                                                    store
                                                    church-third)
                                                   (cons
                                                     'a1075
                                                     address)
                                                   store
                                                   church-ret1))))
                                            (cons 'a1076
                                              address)
                                            store
                                            ((church-force
                                               (cons 'a1077
                                                 address)
                                               store
                                               church-second)
                                              (cons 'a1078
                                                address)
                                              store
                                              church-ret1))))
                                       (cons 'a1079 address)
                                       store
                                       ((church-force
                                          (cons 'a1080
                                            address)
                                          store church-first)
                                         (cons 'a1081
                                           address)
                                         store church-ret1))))
                                  (cons 'a1082 address)
                                  store
                                  ((church-force
                                     (cons 'a1083 address)
                                     store
                                     ((church-force
                                        (cons 'a1084 address)
                                        store
                                        church-xrp-draw-proposer)
                                       (cons 'a1085 address)
                                       store
                                       church-chosen-xrp))
                                    (cons 'a1086 address)
                                    store church-state))))
                             (cons 'a1087 address) store
                             ((church-force
                                (cons 'a1088 address) store
                                church-uniform-draw)
                               (cons 'a1089 address) store
                               church-proposal-xrps)))))
                    (cons 'a1090 address) store
                    ((church-force (cons 'a1091 address)
                       store church-proposable-xrps)
                      (cons 'a1092 address) store
                      church-state church-proposable?)))))
           (church-basic-proposal-distribution
            (lambda
              (address store church-state
                church-normal-form-proc)
              ((church-force (cons 'a1093 address) store
                 church-selective-proposal-distribution)
                (cons 'a1094 address) store church-state
                church-normal-form-proc
                (lambda (address store church-xrp-draw)
                  church-true))))
           (church-rejection-initializer
            (lambda (address store church-normal-form-proc)
              ((church-force (cons 'a1095 address) store
                 (lambda
                   (address store church-proposal-state)
                   (if (church-force (cons 'a1096 address)
                         store
                         ((church-force
                            (cons 'a1097 address) store
                            church-=)
                           (cons 'a1098 address) store
                           -inf.0
                           ((church-force
                              (cons 'a1099 address) store
                              church-mcmc-state->score)
                             (cons 'a1100 address) store
                             church-proposal-state)))
                       ((church-force (cons 'a1101 address)
                          store church-rejection-initializer)
                         (cons 'a1102 address) store
                         church-normal-form-proc)
                       church-proposal-state)))
                (cons 'a1103 address) store
                ((church-force (cons 'a1104 address) store
                   church-update->state)
                  (cons 'a1105 address) store
                  ((church-force (cons 'a1106 address) store
                     church-counterfactual-update)
                    (cons 'a1107 address) store
                    ((church-force (cons 'a1108 address)
                       store church-make-initial-mcmc-state)
                      (cons 'a1109 address) store)
                    church-normal-form-proc)))))
           (church-verbose-init #t)
           (church-annealing-initializer
            (lambda
              (address store church-rej-steps
               church-temps:low->high church-temps->nfqp
               . church-rejuv-kernel-builder)
              ((church-force (cons 'a1110 address) store
                 (lambda
                   (address store
                     church-rejuv-kernel-builder)
                   ((church-force (cons 'a1111 address)
                      store
                      (lambda
                        (address store
                          church-temps:high->low)
                        ((church-force (cons 'a1112 address)
                           store
                           (lambda
                             (address store
                               church-normal-form-proc)
                             ((church-force
                                (cons 'a1113 address) store
                                (lambda
                                  (address store
                                    church-initial-state)
                                  (letrec ((church-next-temp
                                            (lambda
                                              (address store
                                                church-temps
                                                church-mcmc-state)
                                              (if (church-force
                                                    (cons
                                                      'a1114
                                                      address)
                                                    store
                                                    ((church-force
                                                       (cons
                                                         'a1115
                                                         address)
                                                       store
                                                       church-=)
                                                      (cons
                                                        'a1116
                                                        address)
                                                      store
                                                      -inf.0
                                                      ((church-force
                                                         (cons
                                                           'a1117
                                                           address)
                                                         store
                                                         church-mcmc-state->score)
                                                        (cons
                                                          'a1118
                                                          address)
                                                        store
                                                        church-mcmc-state)))
                                                  (begin
                                                    (church-force
                                                      (cons
                                                        'a1119
                                                        address)
                                                      store
                                                      (if (church-force
                                                            (cons
                                                              'a1120
                                                              address)
                                                            store
                                                            church-verbose-init)
                                                          (begin
                                                            ((church-force
                                                               (cons
                                                                 'a1121
                                                                 address)
                                                               store
                                                               church-display)
                                                              (cons
                                                                'a1122
                                                                address)
                                                              store
                                                              "annealing-initializer: failed, restarting at top ...\n"))
                                                          '(void)))
                                                    ((church-force
                                                       (cons
                                                         'a1123
                                                         address)
                                                       store
                                                       church-annealing-initializer)
                                                      (cons
                                                        'a1124
                                                        address)
                                                      store
                                                      church-rej-steps
                                                      church-temps:low->high
                                                      church-temps->nfqp
                                                      church-rejuv-kernel-builder))
                                                  (if (church-force
                                                        (cons
                                                          'a1125
                                                          address)
                                                        store
                                                        ((church-force
                                                           (cons
                                                             'a1126
                                                             address)
                                                           store
                                                           church-null?)
                                                          (cons
                                                            'a1127
                                                            address)
                                                          store
                                                          church-temps))
                                                      (begin
                                                        (church-force
                                                          (cons
                                                            'a1128
                                                            address)
                                                          store
                                                          (if (church-force
                                                                (cons
                                                                  'a1129
                                                                  address)
                                                                store
                                                                church-verbose-init)
                                                              (begin
                                                                ((church-force
                                                                   (cons
                                                                     'a1130
                                                                     address)
                                                                   store
                                                                   church-display)
                                                                  (cons
                                                                    'a1131
                                                                    address)
                                                                  store
                                                                  "annealing-initializer: succeeded!\n"))
                                                              '(void)))
                                                        church-mcmc-state)
                                                      (begin
                                                        (church-force
                                                          (cons
                                                            'a1132
                                                            address)
                                                          store
                                                          (if (church-force
                                                                (cons
                                                                  'a1133
                                                                  address)
                                                                store
                                                                church-verbose-init)
                                                              (begin
                                                                ((church-force
                                                                   (cons
                                                                     'a1134
                                                                     address)
                                                                   store
                                                                   church-for-each)
                                                                  (cons
                                                                    'a1135
                                                                    address)
                                                                  store
                                                                  church-display
                                                                  ((church-force
                                                                     (cons
                                                                       'a1136
                                                                       address)
                                                                     store
                                                                     church-list)
                                                                    (cons
                                                                      'a1137
                                                                      address)
                                                                    store
                                                                    "annealing-initializer:\n"
                                                                    "  temps remaining: "
                                                                    ((church-force
                                                                       (cons
                                                                         'a1138
                                                                         address)
                                                                       store
                                                                       church-length)
                                                                      (cons
                                                                        'a1139
                                                                        address)
                                                                      store
                                                                      church-temps)
                                                                    "\n  current temp: "
                                                                    ((church-force
                                                                       (cons
                                                                         'a1140
                                                                         address)
                                                                       store
                                                                       church-first)
                                                                      (cons
                                                                        'a1141
                                                                        address)
                                                                      store
                                                                      church-temps)
                                                                    "\n")))
                                                              '(void)))
                                                        ((church-force
                                                           (cons
                                                             'a1142
                                                             address)
                                                           store
                                                           (lambda
                                                             (address
                                                               store
                                                               church-nfqp)
                                                             ((church-force
                                                                (cons
                                                                  'a1143
                                                                  address)
                                                                store
                                                                (lambda
                                                                  (address
                                                                    store
                                                                    church-rescored-state)
                                                                  ((church-force
                                                                     (cons
                                                                       'a1144
                                                                       address)
                                                                     store
                                                                     (lambda
                                                                       (address
                                                                         store
                                                                         church-kernel)
                                                                       ((church-force
                                                                          (cons
                                                                            'a1145
                                                                            address)
                                                                          store
                                                                          (lambda
                                                                            (address
                                                                              store
                                                                              church-rej-state)
                                                                            ((church-force
                                                                               (cons
                                                                                 'a1146
                                                                                 address)
                                                                               store
                                                                               church-next-temp)
                                                                              (cons
                                                                                'a1147
                                                                                address)
                                                                              store
                                                                              ((church-force
                                                                                 (cons
                                                                                   'a1148
                                                                                   address)
                                                                                 store
                                                                                 church-rest)
                                                                                (cons
                                                                                  'a1149
                                                                                  address)
                                                                                store
                                                                                church-temps)
                                                                              church-rej-state)))
                                                                         (cons
                                                                           'a1150
                                                                           address)
                                                                         store
                                                                         ((church-force
                                                                            (cons
                                                                              'a1151
                                                                              address)
                                                                            store
                                                                            church-kernel)
                                                                           (cons
                                                                             'a1152
                                                                             address)
                                                                           store
                                                                           church-rescored-state))))
                                                                    (cons
                                                                      'a1153
                                                                      address)
                                                                    store
                                                                    ((church-force
                                                                       (cons
                                                                         'a1154
                                                                         address)
                                                                       store
                                                                       church-rejuv-kernel-builder)
                                                                      (cons
                                                                        'a1155
                                                                        address)
                                                                      store
                                                                      church-nfqp))))
                                                               (cons
                                                                 'a1156
                                                                 address)
                                                               store
                                                               ((church-force
                                                                  (cons
                                                                    'a1157
                                                                    address)
                                                                  store
                                                                  church-update->state)
                                                                 (cons
                                                                   'a1158
                                                                   address)
                                                                 store
                                                                 ((church-force
                                                                    (cons
                                                                      'a1159
                                                                      address)
                                                                    store
                                                                    church-counterfactual-update)
                                                                   (cons
                                                                     'a1160
                                                                     address)
                                                                   store
                                                                   church-mcmc-state
                                                                   church-nfqp)))))
                                                          (cons
                                                            'a1161
                                                            address)
                                                          store
                                                          ((church-force
                                                             (cons
                                                               'a1162
                                                               address)
                                                             store
                                                             church-apply)
                                                            (cons
                                                              'a1163
                                                              address)
                                                            store
                                                            church-temps->nfqp
                                                            ((church-force
                                                               (cons
                                                                 'a1164
                                                                 address)
                                                               store
                                                               church-first)
                                                              (cons
                                                                'a1165
                                                                address)
                                                              store
                                                              church-temps)))))))))
                                    ((church-force
                                       (cons 'a1166 address)
                                       store
                                       church-next-temp)
                                      (cons 'a1167 address)
                                      store
                                      ((church-force
                                         (cons 'a1168
                                           address)
                                         store church-rest)
                                        (cons 'a1169 address)
                                        store
                                        church-temps:high->low)
                                      church-initial-state))))
                               (cons 'a1170 address) store
                               (begin
                                 (church-force
                                   (cons 'a1171 address)
                                   store
                                   ((church-force
                                      (cons 'a1172 address)
                                      store
                                      church-reset-store-xrp-draws)
                                     (cons 'a1173 address)
                                     store))
                                 ((church-force
                                    (cons 'a1174 address)
                                    store
                                    church-rejection-initializer)
                                   (cons 'a1175 address)
                                   store
                                   church-normal-form-proc)))))
                          (cons 'a1176 address) store
                          ((church-force
                             (cons 'a1177 address) store
                             church-apply)
                            (cons 'a1178 address) store
                            church-temps->nfqp
                            ((church-force
                               (cons 'a1179 address) store
                               church-first)
                              (cons 'a1180 address) store
                              church-temps:high->low)))))
                     (cons 'a1181 address) store
                     ((church-force (cons 'a1182 address)
                        store church-reverse)
                       (cons 'a1183 address) store
                       church-temps:low->high))))
                (cons 'a1184 address) store
                (if (church-force (cons 'a1185 address)
                      store
                      ((church-force (cons 'a1186 address)
                         store church-null?)
                        (cons 'a1187 address) store
                        church-rejuv-kernel-builder))
                    (lambda (address store church-nfqp)
                      ((church-force (cons 'a1188 address)
                         store church-basic-repeat-kernel)
                        (cons 'a1189 address) store
                        church-rej-steps church-nfqp))
                    ((church-force (cons 'a1190 address)
                       store church-first)
                      (cons 'a1191 address) store
                      church-rejuv-kernel-builder)))))
           (church-make-mh-kernel
            (lambda
              (address store church-proposal-distribution
                church-scorer)
              (lambda (address store church-state)
                ((church-force (cons 'a1192 address) store
                   (lambda (address store church-ret)
                     ((church-force (cons 'a1193 address)
                        store
                        (lambda (address store church-bw/fw)
                          ((church-force
                             (cons 'a1194 address) store
                             (lambda
                               (address store
                                 church-proposal-state)
                               ((church-force
                                  (cons 'a1195 address)
                                  store
                                  (lambda
                                    (address store
                                      church-old-p)
                                    ((church-force
                                       (cons 'a1196 address)
                                       store
                                       (lambda
                                         (address store
                                           church-new-p)
                                         ((church-force
                                            (cons 'a1197
                                              address)
                                            store
                                            (lambda
                                              (address store
                                                church-accept)
                                              ((church-force
                                                 (cons
                                                   'a1198
                                                   address)
                                                 store
                                                 (lambda
                                                   (address
                                                     store
                                                     church-dummy)
                                                   (if (church-force
                                                         (cons
                                                           'a1199
                                                           address)
                                                         store
                                                         church-accept)
                                                       church-proposal-state
                                                       church-state)))
                                                (cons 'a1200
                                                  address)
                                                store
                                                ((church-force
                                                   (cons
                                                     'a1201
                                                     address)
                                                   store
                                                   church-reset-store-xrp-draws)
                                                  (cons
                                                    'a1202
                                                    address)
                                                  store))))
                                           (cons 'a1203
                                             address)
                                           store
                                           ((church-force
                                              (cons 'a1204
                                                address)
                                              store
                                              church-log-flip)
                                             (cons 'a1205
                                               address)
                                             store
                                             ((church-force
                                                (cons 'a1206
                                                  address)
                                                store
                                                church-min)
                                               (cons 'a1207
                                                 address)
                                               store 0.0
                                               ((church-force
                                                  (cons
                                                    'a1208
                                                    address)
                                                  store
                                                  church-+)
                                                 (cons
                                                   'a1209
                                                   address)
                                                 store
                                                 ((church-force
                                                    (cons
                                                      'a1210
                                                      address)
                                                    store
                                                    church--)
                                                   (cons
                                                     'a1211
                                                     address)
                                                   store
                                                   church-new-p
                                                   church-old-p)
                                                 church-bw/fw))))))
                                      (cons 'a1212 address)
                                      store
                                      ((church-force
                                         (cons 'a1213
                                           address)
                                         store church-scorer)
                                        (cons 'a1214 address)
                                        store
                                        church-proposal-state))))
                                 (cons 'a1215 address) store
                                 ((church-force
                                    (cons 'a1216 address)
                                    store church-scorer)
                                   (cons 'a1217 address)
                                   store church-state))))
                            (cons 'a1218 address) store
                            ((church-force
                               (cons 'a1219 address) store
                               church-second)
                              (cons 'a1220 address) store
                              church-ret))))
                       (cons 'a1221 address) store
                       ((church-force (cons 'a1222 address)
                          store church-first)
                         (cons 'a1223 address) store
                         church-ret))))
                  (cons 'a1224 address) store
                  ((church-force (cons 'a1225 address) store
                     church-proposal-distribution)
                    (cons 'a1226 address) store church-state)))))
           (church-cycle-kernel
            (lambda (address store . church-kernels)
              (lambda (address store church-state)
                ((church-force (cons 'a1227 address) store
                   church-fold)
                  (cons 'a1228 address) store
                  (lambda (address store church-k church-s)
                    ((church-force (cons 'a1229 address)
                       store church-k)
                      (cons 'a1230 address) store church-s))
                  church-state church-kernels))))
           (church-repeat-kernel
            (lambda
              (address store church-steps church-kernel)
              ((church-force (cons 'a1231 address) store
                 church-apply)
                (cons 'a1232 address) store
                church-cycle-kernel
                ((church-force (cons 'a1233 address) store
                   church-make-list)
                  (cons 'a1234 address) store church-steps
                  church-kernel))))
           (church-basic-repeat-kernel
            (lambda (address store church-steps church-nfqp)
              ((church-force (cons 'a1235 address) store
                 church-repeat-kernel)
                (cons 'a1236 address) store church-steps
                ((church-force (cons 'a1237 address) store
                   church-make-mh-kernel)
                  (cons 'a1238 address) store
                  (lambda (address store church-state)
                    ((church-force (cons 'a1239 address)
                       store
                       church-basic-proposal-distribution)
                      (cons 'a1240 address) store
                      church-state church-nfqp))
                  church-mcmc-state->score))))
           (church-inference-timing #f)
           (church-with-times
            (lambda (address store church-proc)
              (begin
                (church-force (cons 'a1241 address) store
                  ((church-force (cons 'a1242 address) store
                     church-for-each)
                    (cons 'a1243 address) store
                    church-display
                    ((church-force (cons 'a1244 address)
                       store church-list)
                      (cons 'a1245 address) store "start: "
                      ((church-force (cons 'a1246 address)
                         store church-current-date)
                        (cons 'a1247 address) store)
                      "\n")))
                ((church-force (cons 'a1248 address) store
                   (lambda
                     (address store church-return-value)
                     (begin
                       (church-force (cons 'a1249 address)
                         store
                         ((church-force
                            (cons 'a1250 address) store
                            church-for-each)
                           (cons 'a1251 address) store
                           church-display
                           ((church-force
                              (cons 'a1252 address) store
                              church-list)
                             (cons 'a1253 address) store
                             "done: "
                             ((church-force
                                (cons 'a1254 address) store
                                church-current-date)
                               (cons 'a1255 address) store)
                             "\n")))
                       church-return-value)))
                  (cons 'a1256 address) store
                  ((church-force (cons 'a1257 address) store
                     church-proc)
                    (cons 'a1258 address) store)))))
           (church-repeated-mcmc-query-core
            (lambda
              (address store church-initializer
                church-kernel church-state->sample
                church-num-samples)
              ((church-force (cons 'a1259 address) store
                 (lambda (address store church-init-state)
                   (if (church-force (cons 'a1260 address)
                         store church-inference-timing)
                       ((church-force (cons 'a1261 address)
                          store church-with-times)
                         (cons 'a1262 address) store
                         (lambda (address store)
                           ((church-force
                              (cons 'a1263 address) store
                              church-mcmc-loop)
                             (cons 'a1264 address) store
                             church-kernel church-init-state
                             church-state->sample
                             church-num-samples '())))
                       ((church-force (cons 'a1265 address)
                          store church-mcmc-loop)
                         (cons 'a1266 address) store
                         church-kernel church-init-state
                         church-state->sample
                         church-num-samples '()))))
                (cons 'a1267 address) store
                ((church-force (cons 'a1268 address) store
                   church-initializer)
                  (cons 'a1269 address) store))))
           (church-mcmc-loop
            (lambda
              (address store church-kernel church-state
                church-state->sample church-samples-left
                church-samples)
              (if (church-force (cons 'a1270 address) store
                    ((church-force (cons 'a1271 address)
                       store church-<)
                      (cons 'a1272 address) store
                      church-samples-left 1))
                  ((church-force (cons 'a1273 address) store
                     church-reverse)
                    (cons 'a1274 address) store
                    church-samples)
                  ((church-force (cons 'a1275 address) store
                     church-mcmc-loop)
                    (cons 'a1276 address) store
                    church-kernel
                    ((church-force (cons 'a1277 address)
                       store church-kernel)
                      (cons 'a1278 address) store
                      church-state)
                    church-state->sample
                    ((church-force (cons 'a1279 address)
                       store church--)
                      (cons 'a1280 address) store
                      church-samples-left 1)
                    ((church-force (cons 'a1281 address)
                       store church-pair)
                      (cons 'a1282 address) store
                      ((church-force (cons 'a1283 address)
                         store church-state->sample)
                        (cons 'a1284 address) store
                        church-state)
                      church-samples)))))
           (church-mh-query
            (lambda
              (address store church-samples church-lag
                church-normal-form-proc)
              ((church-force (cons 'a1285 address) store
                 church-repeated-mcmc-query-core)
                (cons 'a1286 address) store
                (lambda (address store)
                  ((church-force (cons 'a1287 address) store
                     church-rejection-initializer)
                    (cons 'a1288 address) store
                    church-normal-form-proc))
                ((church-force (cons 'a1289 address) store
                   church-basic-repeat-kernel)
                  (cons 'a1290 address) store church-lag
                  church-normal-form-proc)
                church-mcmc-state->query-value
                church-samples)))
           (church-mh-query/annealed-init
            (lambda
              (address store church-temps church-samples
                church-lag church-rej-steps
                church-temps->nfqp)
              ((church-force (cons 'a1291 address) store
                 (lambda
                   (address store church-normal-form-proc)
                   ((church-force (cons 'a1292 address)
                      store church-repeated-mcmc-query-core)
                     (cons 'a1293 address) store
                     (lambda (address store)
                       ((church-force (cons 'a1294 address)
                          store church-annealing-initializer)
                         (cons 'a1295 address) store
                         church-rej-steps church-temps
                         church-temps->nfqp))
                     ((church-force (cons 'a1296 address)
                        store church-basic-repeat-kernel)
                       (cons 'a1297 address) store
                       church-lag church-normal-form-proc)
                     church-mcmc-state->query-value
                     church-samples)))
                (cons 'a1298 address) store
                ((church-force (cons 'a1299 address) store
                   church-apply)
                  (cons 'a1300 address) store
                  church-temps->nfqp
                  ((church-force (cons 'a1301 address) store
                     church-first)
                    (cons 'a1302 address) store church-temps)))))
           (church-make-gradient-step
            (lambda
              (address store church-step-size church-nfqp)
              (lambda (address store church-state)
                ((church-force (cons 'a1303 address) store
                   (lambda (address store church-grad)
                     ((church-force (cons 'a1304 address)
                        store
                        (lambda
                          (address store church-xrp-draws)
                          ((church-force
                             (cons 'a1305 address) store
                             (lambda
                               (address store
                                 church-xrp-changes)
                               ((church-force
                                  (cons 'a1306 address)
                                  store
                                  (lambda
                                    (address store
                                      church-proposal)
                                    ((church-force
                                       (cons 'a1307 address)
                                       store
                                       church-update->state)
                                      (cons 'a1308 address)
                                      store church-proposal)))
                                 (cons 'a1309 address) store
                                 ((church-force
                                    (cons 'a1310 address)
                                    store church-apply)
                                   (cons 'a1311 address)
                                   store
                                   church-counterfactual-update
                                   ((church-force
                                      (cons 'a1312 address)
                                      store church-pair)
                                     (cons 'a1313 address)
                                     store church-state
                                     ((church-force
                                        (cons 'a1314 address)
                                        store church-pair)
                                       (cons 'a1315 address)
                                       store church-nfqp
                                       church-xrp-changes))))))
                            (cons 'a1316 address) store
                            ((church-force
                               (cons 'a1317 address) store
                               church-map)
                              (cons 'a1318 address) store
                              (lambda
                                (address store church-gv)
                                ((church-force
                                   (cons 'a1319 address)
                                   store
                                   (lambda
                                     (address store
                                       church-xrp-draw)
                                     ((church-force
                                        (cons 'a1320 address)
                                        store church-pair)
                                       (cons 'a1321 address)
                                       store church-xrp-draw
                                       ((church-force
                                          (cons 'a1322
                                            address)
                                          store church-+)
                                         (cons 'a1323
                                           address)
                                         store
                                         ((church-force
                                            (cons 'a1324
                                              address)
                                            store
                                            church-xrp-draw-value)
                                           (cons 'a1325
                                             address)
                                           store
                                           church-xrp-draw)
                                         ((church-force
                                            (cons 'a1326
                                              address)
                                            store church-*)
                                           (cons 'a1327
                                             address)
                                           store
                                           church-step-size
                                           ((church-force
                                              (cons 'a1328
                                                address)
                                              store
                                              church-sigmoid)
                                             (cons 'a1329
                                               address)
                                             store
                                             ((church-force
                                                (cons 'a1330
                                                  address)
                                                store
                                                church-rest)
                                               (cons 'a1331
                                                 address)
                                               store
                                               church-gv)))))))
                                  (cons 'a1332 address)
                                  store
                                  ((church-force
                                     (cons 'a1333 address)
                                     store church-first)
                                    (cons 'a1334 address)
                                    store
                                    ((church-force
                                       (cons 'a1335 address)
                                       store
                                       church-pull-outof-addbox)
                                      (cons 'a1336 address)
                                      store church-xrp-draws
                                      ((church-force
                                         (cons 'a1337
                                           address)
                                         store church-first)
                                        (cons 'a1338 address)
                                        store church-gv)))))
                              church-grad))))
                       (cons 'a1339 address) store
                       ((church-force (cons 'a1340 address)
                          store church-mcmc-state->xrp-draws)
                         (cons 'a1341 address) store
                         church-state))))
                  (cons 'a1342 address) store
                  ((church-force (cons 'a1343 address) store
                     church-mcmc-state->gradient)
                    (cons 'a1344 address) store church-state)))))
           (church-sigmoid
            (lambda (address store church-x)
              ((church-force (cons 'a1345 address) store
                 church--)
                (cons 'a1346 address) store
                ((church-force (cons 'a1347 address) store
                   church-/)
                  (cons 'a1348 address) store 1
                  ((church-force (cons 'a1349 address) store
                     church-+)
                    (cons 'a1350 address) store 1
                    ((church-force (cons 'a1351 address)
                       store church-exp)
                      (cons 'a1352 address) store
                      ((church-force (cons 'a1353 address)
                         store church--)
                        (cons 'a1354 address) store church-x))))
                0.5)))
           (church-gradient-ascent
            (lambda
              (address store church-steps church-step-size
                church-nfqp)
              ((church-force (cons 'a1355 address) store
                 (lambda (address store church-gstep)
                   (letrec ((church-loop
                             (lambda
                               (address store church-state
                                 church-trail
                                 church-steps-remaining)
                               (if (church-force
                                     (cons 'a1356 address)
                                     store
                                     ((church-force
                                        (cons 'a1357 address)
                                        store church-<)
                                       (cons 'a1358 address)
                                       store
                                       church-steps-remaining
                                       1))
                                   ((church-force
                                      (cons 'a1359 address)
                                      store church-reverse)
                                     (cons 'a1360 address)
                                     store church-trail)
                                   ((church-force
                                      (cons 'a1361 address)
                                      store
                                      (lambda
                                        (address store
                                          church-newstate)
                                        ((church-force
                                           (cons 'a1362
                                             address)
                                           store church-loop)
                                          (cons 'a1363
                                            address)
                                          store
                                          church-newstate
                                          ((church-force
                                             (cons 'a1364
                                               address)
                                             store
                                             church-pair)
                                            (cons 'a1365
                                              address)
                                            store
                                            ((church-force
                                               (cons 'a1366
                                                 address)
                                               store
                                               church-mcmc-state->query-value)
                                              (cons 'a1367
                                                address)
                                              store
                                              church-newstate)
                                            church-trail)
                                          ((church-force
                                             (cons 'a1368
                                               address)
                                             store church--)
                                            (cons 'a1369
                                              address)
                                            store
                                            church-steps-remaining
                                            1))))
                                     (cons 'a1370 address)
                                     store
                                     ((church-force
                                        (cons 'a1371 address)
                                        store church-gstep)
                                       (cons 'a1372 address)
                                       store church-state))))))
                     ((church-force (cons 'a1373 address)
                        store church-loop)
                       (cons 'a1374 address) store
                       ((church-force (cons 'a1375 address)
                          store church-rejection-initializer)
                         (cons 'a1376 address) store
                         church-nfqp)
                       '() church-steps))))
                (cons 'a1377 address) store
                ((church-force (cons 'a1378 address) store
                   church-make-gradient-step)
                  (cons 'a1379 address) store
                  church-step-size church-nfqp))))
           (church-annealed-gradient-ascent
            (lambda
              (address store church-temps:high->low
                church-step-size church-temps->nfqp)
              (letrec ((church-loop
                        (lambda
                          (address store church-state
                            church-trail church-temps)
                          (if (church-force
                                (cons 'a1380 address) store
                                ((church-force
                                   (cons 'a1381 address)
                                   store church-null?)
                                  (cons 'a1382 address)
                                  store church-temps))
                              ((church-force
                                 (cons 'a1383 address) store
                                 church-reverse)
                                (cons 'a1384 address) store
                                church-trail)
                              ((church-force
                                 (cons 'a1385 address) store
                                 (lambda
                                   (address store
                                     church-newstate)
                                   (begin
                                     (church-force
                                       (cons 'a1386 address)
                                       store
                                       ((church-force
                                          (cons 'a1387
                                            address)
                                          store
                                          church-display)
                                         (cons 'a1388
                                           address)
                                         store
                                         "ascent loop, temp="))
                                     (church-force
                                       (cons 'a1389 address)
                                       store
                                       ((church-force
                                          (cons 'a1390
                                            address)
                                          store
                                          church-display)
                                         (cons 'a1391
                                           address)
                                         store
                                         ((church-force
                                            (cons 'a1392
                                              address)
                                            store
                                            church-first)
                                           (cons 'a1393
                                             address)
                                           store
                                           church-temps)))
                                     (church-force
                                       (cons 'a1394 address)
                                       store
                                       ((church-force
                                          (cons 'a1395
                                            address)
                                          store
                                          church-newline)
                                         (cons 'a1396
                                           address)
                                         store))
                                     ((church-force
                                        (cons 'a1397 address)
                                        store church-loop)
                                       (cons 'a1398 address)
                                       store church-newstate
                                       ((church-force
                                          (cons 'a1399
                                            address)
                                          store church-pair)
                                         (cons 'a1400
                                           address)
                                         store
                                         ((church-force
                                            (cons 'a1401
                                              address)
                                            store
                                            church-mcmc-state->query-value)
                                           (cons 'a1402
                                             address)
                                           store
                                           church-newstate)
                                         church-trail)
                                       ((church-force
                                          (cons 'a1403
                                            address)
                                          store church-rest)
                                         (cons 'a1404
                                           address)
                                         store church-temps)))))
                                (cons 'a1405 address) store
                                ((church-force
                                   (cons 'a1406 address)
                                   store
                                   ((church-force
                                      (cons 'a1407 address)
                                      store
                                      church-make-gradient-step)
                                     (cons 'a1408 address)
                                     store church-step-size
                                     ((church-force
                                        (cons 'a1409 address)
                                        store church-apply)
                                       (cons 'a1410 address)
                                       store
                                       church-temps->nfqp
                                       ((church-force
                                          (cons 'a1411
                                            address)
                                          store church-first)
                                         (cons 'a1412
                                           address)
                                         store church-temps))))
                                  (cons 'a1413 address)
                                  store church-state))))))
                ((church-force (cons 'a1414 address) store
                   church-loop)
                  (cons 'a1415 address) store
                  ((church-force (cons 'a1416 address) store
                     church-rejection-initializer)
                    (cons 'a1417 address) store
                    ((church-force (cons 'a1418 address)
                       store church-apply)
                      (cons 'a1419 address) store
                      church-temps->nfqp
                      ((church-force (cons 'a1420 address)
                         store church-first)
                        (cons 'a1421 address) store
                        church-temps:high->low)))
                  '() church-temps:high->low))))
           (church-continuous-xrp-draw?
            (lambda (address store church-xrp-draw)
              ((church-force (cons 'a1422 address) store
                 church-tape?)
                (cons 'a1423 address) store
                ((church-force (cons 'a1424 address) store
                   church-xrp-draw-value)
                  (cons 'a1425 address) store
                  church-xrp-draw))))
           (church-discrete-xrp-draw?
            (lambda (address store church-xrp-draw)
              ((church-force (cons 'a1426 address) store
                 church-not)
                (cons 'a1427 address) store
                ((church-force (cons 'a1428 address) store
                   church-continuous-xrp-draw?)
                  (cons 'a1429 address) store
                  church-xrp-draw))))
           (church-alist-map
            (lambda (address store church-proc church-alist)
              (if (church-force (cons 'a1430 address) store
                    ((church-force (cons 'a1431 address)
                       store church-null?)
                      (cons 'a1432 address) store
                      church-alist))
                  '()
                  ((church-force (cons 'a1433 address) store
                     (lambda (address store church-fst)
                       ((church-force (cons 'a1434 address)
                          store church-pair)
                         (cons 'a1435 address) store
                         ((church-force
                            (cons 'a1436 address) store
                            church-proc)
                           (cons 'a1437 address) store
                           ((church-force
                              (cons 'a1438 address) store
                              church-first)
                             (cons 'a1439 address) store
                             church-fst)
                           ((church-force
                              (cons 'a1440 address) store
                              church-rest)
                             (cons 'a1441 address) store
                             church-fst))
                         ((church-force
                            (cons 'a1442 address) store
                            church-alist-map)
                           (cons 'a1443 address) store
                           church-proc
                           ((church-force
                              (cons 'a1444 address) store
                              church-rest)
                             (cons 'a1445 address) store
                             church-alist)))))
                    (cons 'a1446 address) store
                    ((church-force (cons 'a1447 address)
                       store church-first)
                      (cons 'a1448 address) store
                      church-alist)))))
           (church-order-values
            (lambda
              (address store church-alist church-order)
              ((church-force (cons 'a1449 address) store
                 (lambda (address store church-trie)
                   ((church-force (cons 'a1450 address)
                      store church-map)
                     (cons 'a1451 address) store
                     (lambda (address store church-key)
                       ((church-force (cons 'a1452 address)
                          store church-first)
                         (cons 'a1453 address) store
                         ((church-force
                            (cons 'a1454 address) store
                            church-trie-pop)
                           (cons 'a1455 address) store
                           church-trie church-key)))
                     church-order)))
                (cons 'a1456 address) store
                ((church-force (cons 'a1457 address) store
                   church-alist->trie)
                  (cons 'a1458 address) store church-alist))))
           (church-scalar*
            (lambda (address store church-sc church-lst)
              ((church-force (cons 'a1459 address) store
                 church-map)
                (cons 'a1460 address) store
                (lambda (address store church-x)
                  ((church-force (cons 'a1461 address) store
                     church-*)
                    (cons 'a1462 address) store church-sc
                    church-x))
                church-lst)))
           (church-list+
            (lambda (address store church-a church-b)
              ((church-force (cons 'a1463 address) store
                 church-map)
                (cons 'a1464 address) store church-+
                church-a church-b)))
           (church-list*
            (lambda (address store church-a church-b)
              ((church-force (cons 'a1465 address) store
                 church-map)
                (cons 'a1466 address) store church-*
                church-a church-b)))
           (church-increment-state
            (lambda
              (address store church-state church-nfqp
                church-increments)
              ((church-force (cons 'a1467 address) store
                 (lambda (address store church-xrp-draws)
                   ((church-force (cons 'a1468 address)
                      store
                      (lambda
                        (address store church-xrp-changes)
                        ((church-force (cons 'a1469 address)
                           store church-apply)
                          (cons 'a1470 address) store
                          church-counterfactual-update
                          ((church-force
                             (cons 'a1471 address) store
                             church-pair)
                            (cons 'a1472 address) store
                            church-state
                            ((church-force
                               (cons 'a1473 address) store
                               church-pair)
                              (cons 'a1474 address) store
                              church-nfqp church-xrp-changes)))))
                     (cons 'a1475 address) store
                     ((church-force (cons 'a1476 address)
                        store church-alist-map)
                       (cons 'a1477 address) store
                       (lambda
                         (address store church-addr
                           church-inc)
                         ((church-force
                            (cons 'a1478 address) store
                            (lambda
                              (address store church-xrp-draw)
                              ((church-force
                                 (cons 'a1479 address) store
                                 church-pair)
                                (cons 'a1480 address) store
                                church-xrp-draw
                                ((church-force
                                   (cons 'a1481 address)
                                   store church-+)
                                  (cons 'a1482 address)
                                  store
                                  ((church-force
                                     (cons 'a1483 address)
                                     store
                                     church-xrp-draw-value)
                                    (cons 'a1484 address)
                                    store church-xrp-draw)
                                  church-inc))))
                           (cons 'a1485 address) store
                           ((church-force
                              (cons 'a1486 address) store
                              church-first)
                             (cons 'a1487 address) store
                             ((church-force
                                (cons 'a1488 address) store
                                church-pull-outof-addbox)
                               (cons 'a1489 address) store
                               church-xrp-draws church-addr))))
                       church-increments))))
                (cons 'a1490 address) store
                ((church-force (cons 'a1491 address) store
                   church-mcmc-state->xrp-draws)
                  (cons 'a1492 address) store church-state))))
           (church-leapfrog-step
            (lambda
              (address store church-nfqp church-q church-a:p
                church-m-inv church-dt)
              ((church-force (cons 'a1493 address) store
                 (lambda (address store church-addresses)
                   ((church-force (cons 'a1494 address)
                      store
                      (lambda (address store church-p)
                        ((church-force (cons 'a1495 address)
                           store
                           (lambda
                             (address store
                               church-q-gradient)
                             ((church-force
                                (cons 'a1496 address) store
                                (lambda
                                  (address store
                                    church-p-half)
                                  ((church-force
                                     (cons 'a1497 address)
                                     store
                                     (lambda
                                       (address store
                                         church-increments)
                                       ((church-force
                                          (cons 'a1498
                                            address)
                                          store
                                          (lambda
                                            (address store
                                              church-qn/bwfw)
                                            ((church-force
                                               (cons 'a1499
                                                 address)
                                               store
                                               (lambda
                                                 (address
                                                   store
                                                   church-q-next-gradient)
                                                 ((church-force
                                                    (cons
                                                      'a1500
                                                      address)
                                                    store
                                                    (lambda
                                                      (address
                                                        store
                                                        church-p-next)
                                                      ((church-force
                                                         (cons
                                                           'a1501
                                                           address)
                                                         store
                                                         church-list)
                                                        (cons
                                                          'a1502
                                                          address)
                                                        store
                                                        ((church-force
                                                           (cons
                                                             'a1503
                                                             address)
                                                           store
                                                           church-update->state)
                                                          (cons
                                                            'a1504
                                                            address)
                                                          store
                                                          church-qn/bwfw)
                                                        ((church-force
                                                           (cons
                                                             'a1505
                                                             address)
                                                           store
                                                           church-map)
                                                          (cons
                                                            'a1506
                                                            address)
                                                          store
                                                          church-pair
                                                          church-addresses
                                                          church-p-next)
                                                        ((church-force
                                                           (cons
                                                             'a1507
                                                             address)
                                                           store
                                                           church-update->cd-bw/fw)
                                                          (cons
                                                            'a1508
                                                            address)
                                                          store
                                                          church-qn/bwfw))))
                                                   (cons
                                                     'a1509
                                                     address)
                                                   store
                                                   ((church-force
                                                      (cons
                                                        'a1510
                                                        address)
                                                      store
                                                      church-list+)
                                                     (cons
                                                       'a1511
                                                       address)
                                                     store
                                                     church-p-half
                                                     ((church-force
                                                        (cons
                                                          'a1512
                                                          address)
                                                        store
                                                        church-scalar*)
                                                       (cons
                                                         'a1513
                                                         address)
                                                       store
                                                       ((church-force
                                                          (cons
                                                            'a1514
                                                            address)
                                                          store
                                                          church-/)
                                                         (cons
                                                           'a1515
                                                           address)
                                                         store
                                                         church-dt
                                                         2.0)
                                                       church-q-next-gradient)))))
                                              (cons 'a1516
                                                address)
                                              store
                                              ((church-force
                                                 (cons
                                                   'a1517
                                                   address)
                                                 store
                                                 church-order-values)
                                                (cons 'a1518
                                                  address)
                                                store
                                                ((church-force
                                                   (cons
                                                     'a1519
                                                     address)
                                                   store
                                                   church-mcmc-state->gradient)
                                                  (cons
                                                    'a1520
                                                    address)
                                                  store
                                                  ((church-force
                                                     (cons
                                                       'a1521
                                                       address)
                                                     store
                                                     church-update->state)
                                                    (cons
                                                      'a1522
                                                      address)
                                                    store
                                                    church-qn/bwfw))
                                                church-addresses))))
                                         (cons 'a1523
                                           address)
                                         store
                                         ((church-force
                                            (cons 'a1524
                                              address)
                                            store
                                            church-increment-state)
                                           (cons 'a1525
                                             address)
                                           store church-q
                                           church-nfqp
                                           ((church-force
                                              (cons 'a1526
                                                address)
                                              store
                                              church-map)
                                             (cons 'a1527
                                               address)
                                             store
                                             church-pair
                                             church-addresses
                                             church-increments)))))
                                    (cons 'a1528 address)
                                    store
                                    ((church-force
                                       (cons 'a1529 address)
                                       store church-scalar*)
                                      (cons 'a1530 address)
                                      store church-dt
                                      ((church-force
                                         (cons 'a1531
                                           address)
                                         store church-list*)
                                        (cons 'a1532 address)
                                        store church-m-inv
                                        church-p-half)))))
                               (cons 'a1533 address) store
                               ((church-force
                                  (cons 'a1534 address)
                                  store church-list+)
                                 (cons 'a1535 address) store
                                 church-p
                                 ((church-force
                                    (cons 'a1536 address)
                                    store church-scalar*)
                                   (cons 'a1537 address)
                                   store
                                   ((church-force
                                      (cons 'a1538 address)
                                      store church-/)
                                     (cons 'a1539 address)
                                     store church-dt 2.0)
                                   church-q-gradient)))))
                          (cons 'a1540 address) store
                          ((church-force
                             (cons 'a1541 address) store
                             church-order-values)
                            (cons 'a1542 address) store
                            ((church-force
                               (cons 'a1543 address) store
                               church-mcmc-state->gradient)
                              (cons 'a1544 address) store
                              church-q)
                            church-addresses))))
                     (cons 'a1545 address) store
                     ((church-force (cons 'a1546 address)
                        store church-map)
                       (cons 'a1547 address) store
                       church-rest church-a:p))))
                (cons 'a1548 address) store
                ((church-force (cons 'a1549 address) store
                   church-map)
                  (cons 'a1550 address) store church-first
                  church-a:p))))
           (church-leapfrog
            (lambda
              (address store church-nfqp church-q church-a:p
               church-dt church-steps . church-maybe-bw/fw)
              ((church-force (cons 'a1551 address) store
                 (lambda
                   (address store church-bw-fw church-m-inv)
                   (if (church-force (cons 'a1552 address)
                         store
                         ((church-force
                            (cons 'a1553 address) store
                            church-=)
                           (cons 'a1554 address) store
                           church-steps 0))
                       ((church-force (cons 'a1555 address)
                          store church-list)
                         (cons 'a1556 address) store
                         church-q church-a:p church-bw-fw)
                       ((church-force (cons 'a1557 address)
                          store
                          (lambda
                            (address store
                              church-qn/pn/bwfw+)
                            ((church-force
                               (cons 'a1558 address) store
                               church-leapfrog)
                              (cons 'a1559 address) store
                              church-nfqp
                              ((church-force
                                 (cons 'a1560 address) store
                                 church-first)
                                (cons 'a1561 address) store
                                church-qn/pn/bwfw+)
                              ((church-force
                                 (cons 'a1562 address) store
                                 church-second)
                                (cons 'a1563 address) store
                                church-qn/pn/bwfw+)
                              church-dt
                              ((church-force
                                 (cons 'a1564 address) store
                                 church--)
                                (cons 'a1565 address) store
                                church-steps 1)
                              ((church-force
                                 (cons 'a1566 address) store
                                 church-+)
                                (cons 'a1567 address) store
                                church-bw-fw
                                ((church-force
                                   (cons 'a1568 address)
                                   store church-third)
                                  (cons 'a1569 address)
                                  store church-qn/pn/bwfw+)))))
                         (cons 'a1570 address) store
                         ((church-force
                            (cons 'a1571 address) store
                            church-leapfrog-step)
                           (cons 'a1572 address) store
                           church-nfqp church-q church-a:p
                           church-m-inv church-dt)))))
                (cons 'a1573 address) store
                (if (church-force (cons 'a1574 address)
                      store
                      ((church-force (cons 'a1575 address)
                         store church-null?)
                        (cons 'a1576 address) store
                        church-maybe-bw/fw))
                    0.0
                    ((church-force (cons 'a1577 address)
                       store church-first)
                      (cons 'a1578 address) store
                      church-maybe-bw/fw))
                ((church-force (cons 'a1579 address) store
                   church-make-list)
                  (cons 'a1580 address) store
                  ((church-force (cons 'a1581 address) store
                     church-length)
                    (cons 'a1582 address) store church-a:p)
                  1.0))))
           (church-make-leapfrog-proposal
            (lambda
              (address store church-nfqp church-dt
                church-steps)
              (lambda (address store church-q-p)
                ((church-force (cons 'a1583 address) store
                   (lambda (address store church-q/p/bwfw)
                     ((church-force (cons 'a1584 address)
                        store church-list)
                       (cons 'a1585 address) store
                       ((church-force (cons 'a1586 address)
                          store church-third)
                         (cons 'a1587 address) store
                         church-q/p/bwfw)
                       ((church-force (cons 'a1588 address)
                          store church-list)
                         (cons 'a1589 address) store
                         ((church-force
                            (cons 'a1590 address) store
                            church-first)
                           (cons 'a1591 address) store
                           church-q/p/bwfw)
                         ((church-force
                            (cons 'a1592 address) store
                            church-second)
                           (cons 'a1593 address) store
                           church-q/p/bwfw)))))
                  (cons 'a1594 address) store
                  ((church-force (cons 'a1595 address) store
                     church-leapfrog)
                    (cons 'a1596 address) store church-nfqp
                    ((church-force (cons 'a1597 address)
                       store church-first)
                      (cons 'a1598 address) store church-q-p)
                    ((church-force (cons 'a1599 address)
                       store church-second)
                      (cons 'a1600 address) store church-q-p)
                    church-dt church-steps)))))
           (church-hamiltonian-score
            (lambda (address store church-q-p)
              ((church-force (cons 'a1601 address) store
                 (lambda (address store church-q church-a:p)
                   ((church-force (cons 'a1602 address)
                      store
                      (lambda (address store church-score)
                        (if (church-force
                              (cons 'a1603 address) store
                              ((church-force
                                 (cons 'a1604 address) store
                                 church-equal?)
                                (cons 'a1605 address) store
                                church-score -inf.0))
                            -inf.0
                            ((church-force
                               (cons 'a1606 address) store
                               church-+)
                              (cons 'a1607 address) store
                              church-score
                              ((church-force
                                 (cons 'a1608 address) store
                                 church-*)
                                (cons 'a1609 address) store
                                -0.5
                                ((church-force
                                   (cons 'a1610 address)
                                   store church-apply)
                                  (cons 'a1611 address)
                                  store church-+
                                  ((church-force
                                     (cons 'a1612 address)
                                     store church-map)
                                    (cons 'a1613 address)
                                    store
                                    (lambda
                                      (address store
                                        church-x)
                                      ((church-force
                                         (cons 'a1614
                                           address)
                                         store church-expt)
                                        (cons 'a1615 address)
                                        store church-x 2))
                                    ((church-force
                                       (cons 'a1616 address)
                                       store church-map)
                                      (cons 'a1617 address)
                                      store church-rest
                                      church-a:p))))))))
                     (cons 'a1618 address) store
                     ((church-force (cons 'a1619 address)
                        store church-mcmc-state->score)
                       (cons 'a1620 address) store church-q))))
                (cons 'a1621 address) store
                ((church-force (cons 'a1622 address) store
                   church-first)
                  (cons 'a1623 address) store church-q-p)
                ((church-force (cons 'a1624 address) store
                   church-second)
                  (cons 'a1625 address) store church-q-p))))
           (church-make-leapfrog-kernel
            (lambda
              (address store church-nfqp church-dt
                church-leapfrog-steps)
              ((church-force (cons 'a1626 address) store
                 church-make-mh-kernel)
                (cons 'a1627 address) store
                ((church-force (cons 'a1628 address) store
                   church-make-leapfrog-proposal)
                  (cons 'a1629 address) store church-nfqp
                  church-dt church-leapfrog-steps)
                church-hamiltonian-score)))
           (church-momentum-prior
            (lambda (address store church-state)
              ((church-force (cons 'a1630 address) store
                 church-fold)
                (cons 'a1631 address) store
                (lambda
                  (address store church-addr/draw
                    church-momenta)
                  (if (church-force (cons 'a1632 address)
                        store
                        ((church-force (cons 'a1633 address)
                           store church-continuous-xrp-draw?)
                          (cons 'a1634 address) store
                          ((church-force
                             (cons 'a1635 address) store
                             church-rest)
                            (cons 'a1636 address) store
                            church-addr/draw)))
                      ((church-force (cons 'a1637 address)
                         store church-pair)
                        (cons 'a1638 address) store
                        ((church-force (cons 'a1639 address)
                           store church-pair)
                          (cons 'a1640 address) store
                          ((church-force
                             (cons 'a1641 address) store
                             church-first)
                            (cons 'a1642 address) store
                            church-addr/draw)
                          ((church-force
                             (cons 'a1643 address) store
                             church-sample-gaussian)
                            (cons 'a1644 address) store 0.0
                            1.0))
                        church-momenta)
                      church-momenta))
                '()
                ((church-force (cons 'a1645 address) store
                   church-addbox->alist)
                  (cons 'a1646 address) store
                  ((church-force (cons 'a1647 address) store
                     church-mcmc-state->xrp-draws)
                    (cons 'a1648 address) store church-state)))))
           (church-make-hmc-kernel
            (lambda
              (address store church-nfqp church-dt
                church-leapfrog-steps)
              ((church-force (cons 'a1649 address) store
                 (lambda
                   (address store church-leapfrog-kernel)
                   (lambda (address store church-state)
                     ((church-force (cons 'a1650 address)
                        store
                        (lambda
                          (address store church-momenta)
                          ((church-force
                             (cons 'a1651 address) store
                             church-first)
                            (cons 'a1652 address) store
                            ((church-force
                               (cons 'a1653 address) store
                               church-leapfrog-kernel)
                              (cons 'a1654 address) store
                              ((church-force
                                 (cons 'a1655 address) store
                                 church-list)
                                (cons 'a1656 address) store
                                church-state church-momenta)))))
                       (cons 'a1657 address) store
                       ((church-force (cons 'a1658 address)
                          store church-momentum-prior)
                         (cons 'a1659 address) store
                         church-state)))))
                (cons 'a1660 address) store
                ((church-force (cons 'a1661 address) store
                   church-make-leapfrog-kernel)
                  (cons 'a1662 address) store church-nfqp
                  church-dt church-leapfrog-steps))))
           (church-hmc-query
            (lambda
              (address store church-num-samples church-lag
                church-dt church-leapfrog-steps church-nfqp)
              ((church-force (cons 'a1663 address) store
                 church-repeated-mcmc-query-core)
                (cons 'a1664 address) store
                (lambda (address store)
                  ((church-force (cons 'a1665 address) store
                     church-rejection-initializer)
                    (cons 'a1666 address) store church-nfqp))
                ((church-force (cons 'a1667 address) store
                   church-repeat-kernel)
                  (cons 'a1668 address) store church-lag
                  ((church-force (cons 'a1669 address) store
                     church-cycle-kernel)
                    (cons 'a1670 address) store
                    ((church-force (cons 'a1671 address)
                       store church-make-hmc-kernel)
                      (cons 'a1672 address) store
                      church-nfqp church-dt
                      church-leapfrog-steps)
                    ((church-force (cons 'a1673 address)
                       store church-make-mh-kernel)
                      (cons 'a1674 address) store
                      (lambda (address store church-state)
                        ((church-force (cons 'a1675 address)
                           store
                           church-selective-proposal-distribution)
                          (cons 'a1676 address) store
                          church-state church-nfqp
                          church-discrete-xrp-draw?))
                      church-mcmc-state->score)))
                church-mcmc-state->query-value
                church-num-samples)))
           (church-hmc-query/annealed-init
            (lambda
              (address store church-temps
                church-init-step-size church-num-samples
                church-lag church-dt church-leapfrog-steps
                church-temps->nfqp)
              ((church-force (cons 'a1677 address) store
                 (lambda (address store church-nfqp)
                   ((church-force (cons 'a1678 address)
                      store church-repeated-mcmc-query-core)
                     (cons 'a1679 address) store
                     (lambda (address store)
                       ((church-force (cons 'a1680 address)
                          store church-annealing-initializer)
                         (cons 'a1681 address) store 1
                         church-temps church-temps->nfqp
                         (lambda (address store church-nfqp)
                           ((church-force
                              (cons 'a1682 address) store
                              church-make-gradient-step)
                             (cons 'a1683 address) store
                             church-init-step-size
                             church-nfqp))))
                     ((church-force (cons 'a1684 address)
                        store church-repeat-kernel)
                       (cons 'a1685 address) store
                       church-lag
                       ((church-force (cons 'a1686 address)
                          store church-cycle-kernel)
                         (cons 'a1687 address) store
                         ((church-force
                            (cons 'a1688 address) store
                            church-make-hmc-kernel)
                           (cons 'a1689 address) store
                           church-nfqp church-dt
                           church-leapfrog-steps)
                         ((church-force
                            (cons 'a1690 address) store
                            church-make-mh-kernel)
                           (cons 'a1691 address) store
                           (lambda
                             (address store church-state)
                             ((church-force
                                (cons 'a1692 address) store
                                church-selective-proposal-distribution)
                               (cons 'a1693 address) store
                               church-state church-nfqp
                               church-discrete-xrp-draw?))
                           church-mcmc-state->score)))
                     church-mcmc-state->query-value
                     church-num-samples)))
                (cons 'a1694 address) store
                ((church-force (cons 'a1695 address) store
                   church-apply)
                  (cons 'a1696 address) store
                  church-temps->nfqp
                  ((church-force (cons 'a1697 address) store
                     church-first)
                    (cons 'a1698 address) store church-temps)))))
           (church-psmc-query
            (lambda
              (address store church-temps church-popsize
                church-lag church-temps->nfqp)
              ((church-force (cons 'a1699 address) store
                 church-map)
                (cons 'a1700 address) store
                church-mcmc-state->query-value
                ((church-force (cons 'a1701 address) store
                   church-smc-core)
                  (cons 'a1702 address) store church-temps
                  church-popsize church-lag
                  church-temps->nfqp))))
           (church-smc-core
            (lambda
              (address store church-temps church-popsize
                church-lag church-temps->nfqp)
              (letrec ((church-smc
                        (lambda
                          (address store church-temps
                            church-population church-weights)
                          ((church-force
                             (cons 'a1703 address) store
                             (lambda
                               (address store church-rets)
                               ((church-force
                                  (cons 'a1704 address)
                                  store
                                  (lambda
                                    (address store
                                      church-new-population)
                                    ((church-force
                                       (cons 'a1705 address)
                                       store
                                       (lambda
                                         (address store
                                           church-cd-bw/fw)
                                         ((church-force
                                            (cons 'a1706
                                              address)
                                            store
                                            (lambda
                                              (address store
                                                church-weights)
                                              ((church-force
                                                 (cons
                                                   'a1707
                                                   address)
                                                 store
                                                 (lambda
                                                   (address
                                                     store
                                                     church-resample-distribution)
                                                   ((church-force
                                                      (cons
                                                        'a1708
                                                        address)
                                                      store
                                                      (lambda
                                                        (address
                                                          store
                                                          church-collapse?)
                                                        ((church-force
                                                           (cons
                                                             'a1709
                                                             address)
                                                           store
                                                           (lambda
                                                             (address
                                                               store
                                                               church-new2-population)
                                                             ((church-force
                                                                (cons
                                                                  'a1710
                                                                  address)
                                                                store
                                                                (lambda
                                                                  (address
                                                                    store
                                                                    church-weights)
                                                                  ((church-force
                                                                     (cons
                                                                       'a1711
                                                                       address)
                                                                     store
                                                                     (lambda
                                                                       (address
                                                                         store
                                                                         church-kernel)
                                                                       ((church-force
                                                                          (cons
                                                                            'a1712
                                                                            address)
                                                                          store
                                                                          (lambda
                                                                            (address
                                                                              store
                                                                              church-new3-population)
                                                                            (begin
                                                                              (church-force
                                                                                (cons
                                                                                  'a1713
                                                                                  address)
                                                                                store
                                                                                ((church-force
                                                                                   (cons
                                                                                     'a1714
                                                                                     address)
                                                                                   store
                                                                                   church-map)
                                                                                  (cons
                                                                                    'a1715
                                                                                    address)
                                                                                  store
                                                                                  (lambda
                                                                                    (address
                                                                                      store
                                                                                      church-x
                                                                                      church-y)
                                                                                    (begin
                                                                                      (church-force
                                                                                        (cons
                                                                                          'a1716
                                                                                          address)
                                                                                        store
                                                                                        ((church-force
                                                                                           (cons
                                                                                             'a1717
                                                                                             address)
                                                                                           store
                                                                                           church-display)
                                                                                          (cons
                                                                                            'a1718
                                                                                            address)
                                                                                          store
                                                                                          "  "))
                                                                                      (church-force
                                                                                        (cons
                                                                                          'a1719
                                                                                          address)
                                                                                        store
                                                                                        ((church-force
                                                                                           (cons
                                                                                             'a1720
                                                                                             address)
                                                                                           store
                                                                                           church-display)
                                                                                          (cons
                                                                                            'a1721
                                                                                            address)
                                                                                          store
                                                                                          church-x))
                                                                                      (church-force
                                                                                        (cons
                                                                                          'a1722
                                                                                          address)
                                                                                        store
                                                                                        ((church-force
                                                                                           (cons
                                                                                             'a1723
                                                                                             address)
                                                                                           store
                                                                                           church-display)
                                                                                          (cons
                                                                                            'a1724
                                                                                            address)
                                                                                          store
                                                                                          "  "))
                                                                                      (church-force
                                                                                        (cons
                                                                                          'a1725
                                                                                          address)
                                                                                        store
                                                                                        ((church-force
                                                                                           (cons
                                                                                             'a1726
                                                                                             address)
                                                                                           store
                                                                                           church-display)
                                                                                          (cons
                                                                                            'a1727
                                                                                            address)
                                                                                          store
                                                                                          church-y))
                                                                                      ((church-force
                                                                                         (cons
                                                                                           'a1728
                                                                                           address)
                                                                                         store
                                                                                         church-display)
                                                                                        (cons
                                                                                          'a1729
                                                                                          address)
                                                                                        store
                                                                                        "\n")))
                                                                                  ((church-force
                                                                                     (cons
                                                                                       'a1730
                                                                                       address)
                                                                                     store
                                                                                     church-map)
                                                                                    (cons
                                                                                      'a1731
                                                                                      address)
                                                                                    store
                                                                                    church-mcmc-state->query-value
                                                                                    church-new3-population)
                                                                                  ((church-force
                                                                                     (cons
                                                                                       'a1732
                                                                                       address)
                                                                                     store
                                                                                     church-map)
                                                                                    (cons
                                                                                      'a1733
                                                                                      address)
                                                                                    store
                                                                                    church-mcmc-state->score
                                                                                    church-new3-population)))
                                                                              (church-force
                                                                                (cons
                                                                                  'a1734
                                                                                  address)
                                                                                store
                                                                                ((church-force
                                                                                   (cons
                                                                                     'a1735
                                                                                     address)
                                                                                   store
                                                                                   church-display)
                                                                                  (cons
                                                                                    'a1736
                                                                                    address)
                                                                                  store
                                                                                  "\n"))
                                                                              (if (church-force
                                                                                    (cons
                                                                                      'a1737
                                                                                      address)
                                                                                    store
                                                                                    ((church-force
                                                                                       (cons
                                                                                         'a1738
                                                                                         address)
                                                                                       store
                                                                                       church-or)
                                                                                      (cons
                                                                                        'a1739
                                                                                        address)
                                                                                      store
                                                                                      church-collapse?
                                                                                      ((church-force
                                                                                         (cons
                                                                                           'a1740
                                                                                           address)
                                                                                         store
                                                                                         church-null?)
                                                                                        (cons
                                                                                          'a1741
                                                                                          address)
                                                                                        store
                                                                                        ((church-force
                                                                                           (cons
                                                                                             'a1742
                                                                                             address)
                                                                                           store
                                                                                           church-rest)
                                                                                          (cons
                                                                                            'a1743
                                                                                            address)
                                                                                          store
                                                                                          church-temps))))
                                                                                  church-new3-population
                                                                                  ((church-force
                                                                                     (cons
                                                                                       'a1744
                                                                                       address)
                                                                                     store
                                                                                     church-smc)
                                                                                    (cons
                                                                                      'a1745
                                                                                      address)
                                                                                    store
                                                                                    ((church-force
                                                                                       (cons
                                                                                         'a1746
                                                                                         address)
                                                                                       store
                                                                                       church-rest)
                                                                                      (cons
                                                                                        'a1747
                                                                                        address)
                                                                                      store
                                                                                      church-temps)
                                                                                    church-new3-population
                                                                                    church-weights)))))
                                                                         (cons
                                                                           'a1748
                                                                           address)
                                                                         store
                                                                         ((church-force
                                                                            (cons
                                                                              'a1749
                                                                              address)
                                                                            store
                                                                            church-map)
                                                                           (cons
                                                                             'a1750
                                                                             address)
                                                                           store
                                                                           church-kernel
                                                                           church-new2-population))))
                                                                    (cons
                                                                      'a1751
                                                                      address)
                                                                    store
                                                                    ((church-force
                                                                       (cons
                                                                         'a1752
                                                                         address)
                                                                       store
                                                                       church-repeat-kernel)
                                                                      (cons
                                                                        'a1753
                                                                        address)
                                                                      store
                                                                      church-lag
                                                                      ((church-force
                                                                         (cons
                                                                           'a1754
                                                                           address)
                                                                         store
                                                                         church-make-mh-kernel)
                                                                        (cons
                                                                          'a1755
                                                                          address)
                                                                        store
                                                                        (lambda
                                                                          (address
                                                                            store
                                                                            church-state)
                                                                          ((church-force
                                                                             (cons
                                                                               'a1756
                                                                               address)
                                                                             store
                                                                             church-basic-proposal-distribution)
                                                                            (cons
                                                                              'a1757
                                                                              address)
                                                                            store
                                                                            church-state
                                                                            ((church-force
                                                                               (cons
                                                                                 'a1758
                                                                                 address)
                                                                               store
                                                                               church-apply)
                                                                              (cons
                                                                                'a1759
                                                                                address)
                                                                              store
                                                                              church-temps->nfqp
                                                                              ((church-force
                                                                                 (cons
                                                                                   'a1760
                                                                                   address)
                                                                                 store
                                                                                 church-first)
                                                                                (cons
                                                                                  'a1761
                                                                                  address)
                                                                                store
                                                                                church-temps))))
                                                                        church-mcmc-state->score)))))
                                                               (cons
                                                                 'a1762
                                                                 address)
                                                               store
                                                               ((church-force
                                                                  (cons
                                                                    'a1763
                                                                    address)
                                                                  store
                                                                  church-make-list)
                                                                 (cons
                                                                   'a1764
                                                                   address)
                                                                 store
                                                                 church-popsize
                                                                 0))))
                                                          (cons
                                                            'a1765
                                                            address)
                                                          store
                                                          (if (church-force
                                                                (cons
                                                                  'a1766
                                                                  address)
                                                                store
                                                                church-collapse?)
                                                              '()
                                                              ((church-force
                                                                 (cons
                                                                   'a1767
                                                                   address)
                                                                 store
                                                                 church-repeat)
                                                                (cons
                                                                  'a1768
                                                                  address)
                                                                store
                                                                church-popsize
                                                                (lambda
                                                                  (address
                                                                    store)
                                                                  (begin
                                                                    (church-force
                                                                      (cons
                                                                        'a1769
                                                                        address)
                                                                      store
                                                                      ((church-force
                                                                         (cons
                                                                           'a1770
                                                                           address)
                                                                         store
                                                                         church-reset-store-xrp-draws)
                                                                        (cons
                                                                          'a1771
                                                                          address)
                                                                        store))
                                                                    ((church-force
                                                                       (cons
                                                                         'a1772
                                                                         address)
                                                                       store
                                                                       church-multinomial)
                                                                      (cons
                                                                        'a1773
                                                                        address)
                                                                      store
                                                                      church-new-population
                                                                      church-resample-distribution))))))))
                                                     (cons
                                                       'a1774
                                                       address)
                                                     store
                                                     ((church-force
                                                        (cons
                                                          'a1775
                                                          address)
                                                        store
                                                        church-nan?)
                                                       (cons
                                                         'a1776
                                                         address)
                                                       store
                                                       ((church-force
                                                          (cons
                                                            'a1777
                                                            address)
                                                          store
                                                          church-first)
                                                         (cons
                                                           'a1778
                                                           address)
                                                         store
                                                         church-resample-distribution)))))
                                                (cons 'a1779
                                                  address)
                                                store
                                                ((church-force
                                                   (cons
                                                     'a1780
                                                     address)
                                                   store
                                                   church-map)
                                                  (cons
                                                    'a1781
                                                    address)
                                                  store
                                                  church-exp
                                                  ((church-force
                                                     (cons
                                                       'a1782
                                                       address)
                                                     store
                                                     church-log-normalize)
                                                    (cons
                                                      'a1783
                                                      address)
                                                    store
                                                    church-weights)))))
                                           (cons 'a1784
                                             address)
                                           store
                                           ((church-force
                                              (cons 'a1785
                                                address)
                                              store
                                              church-map)
                                             (cons 'a1786
                                               address)
                                             store
                                             (lambda
                                               (address
                                                 store
                                                 church-old-weight
                                                 church-old-state
                                                 church-new-state
                                                 church-cd-bw/fw)
                                               ((church-force
                                                  (cons
                                                    'a1787
                                                    address)
                                                  store
                                                  church-+)
                                                 (cons
                                                   'a1788
                                                   address)
                                                 store
                                                 church-old-weight
                                                 ((church-force
                                                    (cons
                                                      'a1789
                                                      address)
                                                    store
                                                    church--)
                                                   (cons
                                                     'a1790
                                                     address)
                                                   store
                                                   ((church-force
                                                      (cons
                                                        'a1791
                                                        address)
                                                      store
                                                      church-mcmc-state->score)
                                                     (cons
                                                       'a1792
                                                       address)
                                                     store
                                                     church-new-state)
                                                   ((church-force
                                                      (cons
                                                        'a1793
                                                        address)
                                                      store
                                                      church-mcmc-state->score)
                                                     (cons
                                                       'a1794
                                                       address)
                                                     store
                                                     church-old-state))
                                                 church-cd-bw/fw))
                                             church-weights
                                             church-population
                                             church-new-population
                                             church-cd-bw/fw))))
                                      (cons 'a1795 address)
                                      store
                                      ((church-force
                                         (cons 'a1796
                                           address)
                                         store church-map)
                                        (cons 'a1797 address)
                                        store
                                        church-update->cd-bw/fw
                                        church-rets))))
                                 (cons 'a1798 address) store
                                 ((church-force
                                    (cons 'a1799 address)
                                    store church-map)
                                   (cons 'a1800 address)
                                   store
                                   church-update->state
                                   church-rets))))
                            (cons 'a1801 address) store
                            ((church-force
                               (cons 'a1802 address) store
                               church-map)
                              (cons 'a1803 address) store
                              (lambda
                                (address store church-state)
                                ((church-force
                                   (cons 'a1804 address)
                                   store
                                   church-counterfactual-update)
                                  (cons 'a1805 address)
                                  store church-state
                                  ((church-force
                                     (cons 'a1806 address)
                                     store church-apply)
                                    (cons 'a1807 address)
                                    store church-temps->nfqp
                                    ((church-force
                                       (cons 'a1808 address)
                                       store church-first)
                                      (cons 'a1809 address)
                                      store church-temps))))
                              church-population)))))
                ((church-force (cons 'a1810 address) store
                   church-smc)
                  (cons 'a1811 address) store church-temps
                  ((church-force (cons 'a1812 address) store
                     church-repeat)
                    (cons 'a1813 address) store
                    church-popsize
                    (lambda (address store)
                      (begin
                        (church-force (cons 'a1814 address)
                          store
                          ((church-force
                             (cons 'a1815 address) store
                             church-reset-store-xrp-draws)
                            (cons 'a1816 address) store))
                        ((church-force (cons 'a1817 address)
                           store
                           church-rejection-initializer)
                          (cons 'a1818 address) store
                          ((church-force
                             (cons 'a1819 address) store
                             church-apply)
                            (cons 'a1820 address) store
                            church-temps->nfqp
                            ((church-force
                               (cons 'a1821 address) store
                               church-first)
                              (cons 'a1822 address) store
                              church-temps))))))
                  ((church-force (cons 'a1823 address) store
                     church-make-list)
                    (cons 'a1824 address) store
                    church-popsize 0)))))
           (church-log-sum-exp
            (lambda (address store . church-log-vals)
              ((church-force (cons 'a1825 address) store
                 (lambda (address store church-max-log-val)
                   (if (church-force (cons 'a1826 address)
                         store
                         ((church-force
                            (cons 'a1827 address) store
                            church-equal?)
                           (cons 'a1828 address) store
                           church-max-log-val -inf.0))
                       -inf.0
                       ((church-force (cons 'a1829 address)
                          store church-+)
                         (cons 'a1830 address) store
                         ((church-force
                            (cons 'a1831 address) store
                            church-log)
                           (cons 'a1832 address) store
                           ((church-force
                              (cons 'a1833 address) store
                              church-exact->inexact)
                             (cons 'a1834 address) store
                             ((church-force
                                (cons 'a1835 address) store
                                church-sum)
                               (cons 'a1836 address) store
                               ((church-force
                                  (cons 'a1837 address)
                                  store church-map)
                                 (cons 'a1838 address) store
                                 (lambda
                                   (address store church-val)
                                   ((church-force
                                      (cons 'a1839 address)
                                      store church-exp)
                                     (cons 'a1840 address)
                                     store
                                     ((church-force
                                        (cons 'a1841 address)
                                        store church--)
                                       (cons 'a1842 address)
                                       store church-val
                                       church-max-log-val)))
                                 church-log-vals))))
                         church-max-log-val))))
                (cons 'a1843 address) store
                ((church-force (cons 'a1844 address) store
                   church-apply)
                  (cons 'a1845 address) store church-max
                  church-log-vals))))
           (church-log-normalize
            (lambda (address store church-log-scores)
              ((church-force (cons 'a1846 address) store
                 (lambda (address store church-score-sum)
                   ((church-force (cons 'a1847 address)
                      store church-map)
                     (cons 'a1848 address) store
                     (lambda (address store church-score)
                       ((church-force (cons 'a1849 address)
                          store church--)
                         (cons 'a1850 address) store
                         church-score church-score-sum))
                     church-log-scores)))
                (cons 'a1851 address) store
                ((church-force (cons 'a1852 address) store
                   church-apply)
                  (cons 'a1853 address) store
                  church-log-sum-exp church-log-scores))))
           (church-mcmc-state->counterfactual-value
            (lambda
              (address store church-state
                church-normal-form-proc)
              ((church-force (cons 'a1854 address) store
                 (lambda
                   (address store
                     church-counterfactual-state)
                   ((church-force (cons 'a1855 address)
                      store church-mcmc-state->query-value)
                     (cons 'a1856 address) store
                     church-counterfactual-state)))
                (cons 'a1857 address) store
                ((church-force (cons 'a1858 address) store
                   church-update->state)
                  (cons 'a1859 address) store
                  ((church-force (cons 'a1860 address) store
                     church-with-interventions)
                    (cons 'a1861 address) store church-state
                    (lambda (address store)
                      ((church-force (cons 'a1862 address)
                         store church-counterfactual-update)
                        (cons 'a1863 address) store
                        church-state church-normal-form-proc)))))))
           (church-counterfactual-query
            (lambda
              (address store church-num-samples church-lag
                church-normal-form-proc)
              ((church-force (cons 'a1864 address) store
                 church-repeated-mcmc-query-core)
                (cons 'a1865 address) store
                (lambda (address store)
                  ((church-force (cons 'a1866 address) store
                     church-rejection-initializer)
                    (cons 'a1867 address) store
                    church-normal-form-proc))
                ((church-force (cons 'a1868 address) store
                   church-basic-repeat-kernel)
                  (cons 'a1869 address) store church-lag
                  church-normal-form-proc)
                (lambda (address store church-state)
                  ((church-force (cons 'a1870 address) store
                     (lambda
                       (address store church-actual-value)
                       ((church-force (cons 'a1871 address)
                          store
                          (lambda
                            (address store
                              church-counterfactual-value)
                            ((church-force
                               (cons 'a1872 address) store
                               church-list)
                              (cons 'a1873 address) store
                              church-actual-value
                              church-counterfactual-value)))
                         (cons 'a1874 address) store
                         ((church-force
                            (cons 'a1875 address) store
                            church-mcmc-state->counterfactual-value)
                           (cons 'a1876 address) store
                           church-state
                           church-normal-form-proc))))
                    (cons 'a1877 address) store
                    ((church-force (cons 'a1878 address)
                       store church-mcmc-state->query-value)
                      (cons 'a1879 address) store
                      church-state)))
                church-num-samples)))
           (church-intervene
            (lambda
              (address store church-value
                church-intervention-value)
              (if (church-force (cons 'a1880 address) store
                    ((church-force (cons 'a1881 address)
                       store church-*intervention*)
                      (cons 'a1882 address) store))
                  church-intervention-value
                  church-value)))
           (church-check-test
            (lambda
              (address store church-info
                church-expectation-fn
                church-true-expectation church-tolerance
                church-name)
              (begin
                (church-force (cons 'a1883 address) store
                  ((church-force (cons 'a1884 address) store
                     church-display)
                    (cons 'a1885 address) store
                    "inference test: "))
                (church-force (cons 'a1886 address) store
                  ((church-force (cons 'a1887 address) store
                     church-display)
                    (cons 'a1888 address) store church-name))
                ((church-force (cons 'a1889 address) store
                   (lambda (address store church-estimates)
                     ((church-force (cons 'a1890 address)
                        store
                        (lambda
                          (address store church-errors)
                          ((church-force
                             (cons 'a1891 address) store
                             (lambda
                               (address store
                                 church-mean-abs-error)
                               ((church-force
                                  (cons 'a1892 address)
                                  store
                                  (lambda
                                    (address store
                                      church-std-error)
                                    (if (church-force
                                          (cons 'a1893
                                            address)
                                          store
                                          ((church-force
                                             (cons 'a1894
                                               address)
                                             store church->)
                                            (cons 'a1895
                                              address)
                                            store
                                            church-mean-abs-error
                                            church-tolerance))
                                        ((church-force
                                           (cons 'a1896
                                             address)
                                           store
                                           church-for-each)
                                          (cons 'a1897
                                            address)
                                          store
                                          church-display
                                          ((church-force
                                             (cons 'a1898
                                               address)
                                             store
                                             church-list)
                                            (cons 'a1899
                                              address)
                                            store
                                            ".. failed! true expectation: "
                                            church-true-expectation
                                            ", test mean: "
                                            ((church-force
                                               (cons 'a1900
                                                 address)
                                               store
                                               church-mean)
                                              (cons 'a1901
                                                address)
                                              store
                                              church-estimates)
                                            "\n"))
                                        ((church-force
                                           (cons 'a1902
                                             address)
                                           store
                                           church-display)
                                          (cons 'a1903
                                            address)
                                          store
                                          ".. passed.\n"))))
                                 (cons 'a1904 address) store
                                 ((church-force
                                    (cons 'a1905 address)
                                    store church-sqrt)
                                   (cons 'a1906 address)
                                   store
                                   ((church-force
                                      (cons 'a1907 address)
                                      store church-/)
                                     (cons 'a1908 address)
                                     store
                                     ((church-force
                                        (cons 'a1909 address)
                                        store church-mean)
                                       (cons 'a1910 address)
                                       store
                                       ((church-force
                                          (cons 'a1911
                                            address)
                                          store church-map)
                                         (cons 'a1912
                                           address)
                                         store
                                         (lambda
                                           (address store
                                             church-x)
                                           ((church-force
                                              (cons 'a1913
                                                address)
                                              store church-*)
                                             (cons 'a1914
                                               address)
                                             store church-x
                                             church-x))
                                         church-errors))
                                     ((church-force
                                        (cons 'a1915 address)
                                        store church-length)
                                       (cons 'a1916 address)
                                       store church-errors))))))
                            (cons 'a1917 address) store
                            ((church-force
                               (cons 'a1918 address) store
                               church-mean)
                              (cons 'a1919 address) store
                              church-errors))))
                       (cons 'a1920 address) store
                       ((church-force (cons 'a1921 address)
                          store church-map)
                         (cons 'a1922 address) store
                         (lambda
                           (address store church-estimate)
                           ((church-force
                              (cons 'a1923 address) store
                              church-abs)
                             (cons 'a1924 address) store
                             ((church-force
                                (cons 'a1925 address) store
                                church--)
                               (cons 'a1926 address) store
                               church-estimate
                               church-true-expectation)))
                         church-estimates))))
                  (cons 'a1927 address) store
                  ((church-force (cons 'a1928 address) store
                     church-map)
                    (cons 'a1929 address) store
                    (lambda (address store church-run)
                      ((church-force (cons 'a1930 address)
                         store church-mean)
                        (cons 'a1931 address) store
                        ((church-force (cons 'a1932 address)
                           store church-map)
                          (cons 'a1933 address) store
                          church-expectation-fn church-run)))
                    church-info)))))
           (church-samples 150)
           (church-lag 20)
           (church-runs 5)
           (church-error-tolerance 7e-2))
    (begin
      (church-force (cons 'a1934 address) store
        ((church-force (cons 'a1935 address) store
           church-check-test)
          (cons 'a1936 address) store
          ((church-force (cons 'a1937 address) store
             church-repeat)
            (cons 'a1938 address) store church-runs
            (lambda (address store)
              ((church-force (cons 'a1939 address) store
                 church-mh-query)
                (cons 'a1940 address) store church-samples
                church-lag
                (lambda (address store)
                  (letrec ((church-a
                            ((church-force
                               (cons 'a1941 address) store
                               church-/)
                              (cons 'a1942 address) store 1
                              1000)))
                    ((church-force (cons 'a1943 address)
                       store church-pair)
                      (cons 'a1944 address) store
                      ((church-force (cons 'a1945 address)
                         store church-flip)
                        (cons 'a1946 address) store church-a)
                      (lambda (address store) church-a)))))))
          (lambda (address store church-b) church-b)
          ((church-force (cons 'a1947 address) store
             church-/)
            (cons 'a1948 address) store 1 1000)
          0.0 "setting a flip"))
      (church-force (cons 'a1949 address) store
        ((church-force (cons 'a1950 address) store
           church-check-test)
          (cons 'a1951 address) store
          ((church-force (cons 'a1952 address) store
             church-repeat)
            (cons 'a1953 address) store church-runs
            (lambda (address store)
              ((church-force (cons 'a1954 address) store
                 church-mh-query)
                (cons 'a1955 address) store church-samples
                church-lag
                (lambda (address store)
                  (begin
                    ((church-force (cons 'a1956 address)
                       store church-pair)
                      (cons 'a1957 address) store
                      church-true
                      (lambda (address store)
                        ((church-force (cons 'a1958 address)
                           store church-flip)
                          (cons 'a1959 address) store 0.7))))))))
          (lambda (address store church-x)
            (if (church-force (cons 'a1960 address) store
                  church-x)
                1
                0))
          0.7 church-error-tolerance "unconditioned flip."))
      (church-force (cons 'a1961 address) store
        ((church-force (cons 'a1962 address) store
           church-check-test)
          (cons 'a1963 address) store
          ((church-force (cons 'a1964 address) store
             church-repeat)
            (cons 'a1965 address) store church-runs
            (lambda (address store)
              ((church-force (cons 'a1966 address) store
                 church-mh-query)
                (cons 'a1967 address) store church-samples
                church-lag
                (lambda (address store)
                  (letrec ((church-a
                            ((church-force
                               (cons 'a1968 address) store
                               church-flip)
                              (cons 'a1969 address) store))
                           (church-b
                            ((church-force
                               (cons 'a1970 address) store
                               church-flip)
                              (cons 'a1971 address) store)))
                    ((church-force (cons 'a1972 address)
                       store church-pair)
                      (cons 'a1973 address) store
                      ((church-force (cons 'a1974 address)
                         store church-or)
                        (cons 'a1975 address) store church-a
                        church-b)
                      (lambda (address store)
                        ((church-force (cons 'a1976 address)
                           store church-and)
                          (cons 'a1977 address) store
                          church-a church-b))))))))
          (lambda (address store church-x)
            (if (church-force (cons 'a1978 address) store
                  church-x)
                1
                0))
          ((church-force (cons 'a1979 address) store
             church-/)
            (cons 'a1980 address) store 1 3)
          church-error-tolerance "and conditioned on or."))
      (church-force (cons 'a1981 address) store
        ((church-force (cons 'a1982 address) store
           church-check-test)
          (cons 'a1983 address) store
          ((church-force (cons 'a1984 address) store
             church-repeat)
            (cons 'a1985 address) store church-runs
            (lambda (address store)
              ((church-force (cons 'a1986 address) store
                 church-mh-query)
                (cons 'a1987 address) store church-samples
                church-lag
                (lambda (address store)
                  (letrec ((church-a
                            ((church-force
                               (cons 'a1988 address) store
                               church-flip)
                              (cons 'a1989 address) store
                              0.3))
                           (church-b
                            ((church-force
                               (cons 'a1990 address) store
                               church-flip)
                              (cons 'a1991 address) store
                              0.3)))
                    ((church-force (cons 'a1992 address)
                       store church-pair)
                      (cons 'a1993 address) store
                      ((church-force (cons 'a1994 address)
                         store church-or)
                        (cons 'a1995 address) store church-a
                        church-b)
                      (lambda (address store)
                        ((church-force (cons 'a1996 address)
                           store church-and)
                          (cons 'a1997 address) store
                          church-a church-b))))))))
          (lambda (address store church-x)
            (if (church-force (cons 'a1998 address) store
                  church-x)
                1
                0))
          ((church-force (cons 'a1999 address) store
             church-/)
            (cons 'a2000 address) store
            ((church-force (cons 'a2001 address) store
               church-*)
              (cons 'a2002 address) store 0.3 0.3)
            ((church-force (cons 'a2003 address) store
               church-+)
              (cons 'a2004 address) store
              ((church-force (cons 'a2005 address) store
                 church-*)
                (cons 'a2006 address) store 0.3 0.3)
              ((church-force (cons 'a2007 address) store
                 church-*)
                (cons 'a2008 address) store 0.7 0.3)
              ((church-force (cons 'a2009 address) store
                 church-*)
                (cons 'a2010 address) store 0.3 0.7)))
          church-error-tolerance
          "and conditioned on or, biased flip."))
      (church-force (cons 'a2011 address) store
        ((church-force (cons 'a2012 address) store
           church-check-test)
          (cons 'a2013 address) store
          ((church-force (cons 'a2014 address) store
             church-repeat)
            (cons 'a2015 address) store church-runs
            (lambda (address store)
              ((church-force (cons 'a2016 address) store
                 church-mh-query)
                (cons 'a2017 address) store church-samples
                church-lag
                (lambda (address store)
                  (letrec ((church-bit-flip
                            (lambda
                              (address store church-fidelity
                                church-x)
                              ((church-force
                                 (cons 'a2018 address) store
                                 church-flip)
                                (cons 'a2019 address) store
                                (if (church-force
                                      (cons 'a2020 address)
                                      store church-x)
                                    church-fidelity
                                    ((church-force
                                       (cons 'a2021 address)
                                       store church--)
                                      (cons 'a2022 address)
                                      store 1
                                      church-fidelity)))))
                           (church-hyp
                            ((church-force
                               (cons 'a2023 address) store
                               church-flip)
                              (cons 'a2024 address) store
                              0.7)))
                    ((church-force (cons 'a2025 address)
                       store church-pair)
                      (cons 'a2026 address) store
                      ((church-force (cons 'a2027 address)
                         store church-bit-flip)
                        (cons 'a2028 address) store 0.8
                        church-hyp)
                      (lambda (address store) church-hyp)))))))
          (lambda (address store church-x)
            (if (church-force (cons 'a2029 address) store
                  church-x)
                1
                0))
          ((church-force (cons 'a2030 address) store
             church-/)
            (cons 'a2031 address) store
            ((church-force (cons 'a2032 address) store
               church-*)
              (cons 'a2033 address) store 0.7 0.8)
            ((church-force (cons 'a2034 address) store
               church-+)
              (cons 'a2035 address) store
              ((church-force (cons 'a2036 address) store
                 church-*)
                (cons 'a2037 address) store 0.7 0.8)
              ((church-force (cons 'a2038 address) store
                 church-*)
                (cons 'a2039 address) store 0.3 0.2)))
          church-error-tolerance "conditioned flip."))
      (church-force (cons 'a2040 address) store
        ((church-force (cons 'a2041 address) store
           church-check-test)
          (cons 'a2042 address) store
          ((church-force (cons 'a2043 address) store
             church-repeat)
            (cons 'a2044 address) store church-runs
            (lambda (address store)
              ((church-force (cons 'a2045 address) store
                 church-mh-query)
                (cons 'a2046 address) store church-samples
                church-lag
                (lambda (address store)
                  (begin
                    ((church-force (cons 'a2047 address)
                       store church-pair)
                      (cons 'a2048 address) store
                      church-true
                      (lambda (address store)
                        (if (church-force
                              (cons 'a2049 address) store
                              ((church-force
                                 (cons 'a2050 address) store
                                 church-flip)
                                (cons 'a2051 address) store
                                0.7))
                            ((church-force
                               (cons 'a2052 address) store
                               church-flip)
                              (cons 'a2053 address) store
                              0.2)
                            ((church-force
                               (cons 'a2054 address) store
                               church-flip)
                              (cons 'a2055 address) store
                              0.8)))))))))
          (lambda (address store church-x)
            (if (church-force (cons 'a2056 address) store
                  church-x)
                1
                0))
          ((church-force (cons 'a2057 address) store
             church-+)
            (cons 'a2058 address) store
            ((church-force (cons 'a2059 address) store
               church-*)
              (cons 'a2060 address) store 0.7 0.2)
            ((church-force (cons 'a2061 address) store
               church-*)
              (cons 'a2062 address) store 0.3 0.8))
          church-error-tolerance
          "random 'if' with random branches, unconditioned."))
      (church-force (cons 'a2063 address) store
        ((church-force (cons 'a2064 address) store
           church-check-test)
          (cons 'a2065 address) store
          ((church-force (cons 'a2066 address) store
             church-repeat)
            (cons 'a2067 address) store church-runs
            (lambda (address store)
              ((church-force (cons 'a2068 address) store
                 church-mh-query)
                (cons 'a2069 address) store church-samples
                church-lag
                (lambda (address store)
                  (begin
                    ((church-force (cons 'a2070 address)
                       store church-pair)
                      (cons 'a2071 address) store
                      church-true
                      (lambda (address store)
                        ((church-force (cons 'a2072 address)
                           store church-flip)
                          (cons 'a2073 address) store
                          (if (church-force
                                (cons 'a2074 address) store
                                ((church-force
                                   (cons 'a2075 address)
                                   store church-flip)
                                  (cons 'a2076 address)
                                  store 0.7))
                              0.2
                              0.8)))))))))
          (lambda (address store church-x)
            (if (church-force (cons 'a2077 address) store
                  church-x)
                1
                0))
          ((church-force (cons 'a2078 address) store
             church-+)
            (cons 'a2079 address) store
            ((church-force (cons 'a2080 address) store
               church-*)
              (cons 'a2081 address) store 0.7 0.2)
            ((church-force (cons 'a2082 address) store
               church-*)
              (cons 'a2083 address) store 0.3 0.8))
          church-error-tolerance
          "flip with random weight, unconditioned."))
      (church-force (cons 'a2084 address) store
        ((church-force (cons 'a2085 address) store
           church-check-test)
          (cons 'a2086 address) store
          ((church-force (cons 'a2087 address) store
             church-repeat)
            (cons 'a2088 address) store church-runs
            (lambda (address store)
              ((church-force (cons 'a2089 address) store
                 church-mh-query)
                (cons 'a2090 address) store church-samples
                church-lag
                (lambda (address store)
                  (letrec ((church-proc
                            (if (church-force
                                  (cons 'a2091 address)
                                  store
                                  ((church-force
                                     (cons 'a2092 address)
                                     store church-flip)
                                    (cons 'a2093 address)
                                    store 0.7))
                                (lambda
                                  (address store church-x)
                                  ((church-force
                                     (cons 'a2094 address)
                                     store church-flip)
                                    (cons 'a2095 address)
                                    store 0.2))
                                (lambda
                                  (address store church-x)
                                  ((church-force
                                     (cons 'a2096 address)
                                     store church-flip)
                                    (cons 'a2097 address)
                                    store 0.8)))))
                    ((church-force (cons 'a2098 address)
                       store church-pair)
                      (cons 'a2099 address) store
                      church-true
                      (lambda (address store)
                        ((church-force (cons 'a2100 address)
                           store church-proc)
                          (cons 'a2101 address) store 1))))))))
          (lambda (address store church-x)
            (if (church-force (cons 'a2102 address) store
                  church-x)
                1
                0))
          ((church-force (cons 'a2103 address) store
             church-+)
            (cons 'a2104 address) store
            ((church-force (cons 'a2105 address) store
               church-*)
              (cons 'a2106 address) store 0.7 0.2)
            ((church-force (cons 'a2107 address) store
               church-*)
              (cons 'a2108 address) store 0.3 0.8))
          church-error-tolerance
          "random procedure application, unconditioned."))
      (church-force (cons 'a2109 address) store
        ((church-force (cons 'a2110 address) store
           church-check-test)
          (cons 'a2111 address) store
          ((church-force (cons 'a2112 address) store
             church-repeat)
            (cons 'a2113 address) store church-runs
            (lambda (address store)
              ((church-force (cons 'a2114 address) store
                 church-mh-query)
                (cons 'a2115 address) store church-samples
                church-lag
                (lambda (address store)
                  (letrec ((church-hyp
                            ((church-force
                               (cons 'a2116 address) store
                               church-multinomial)
                              (cons 'a2117 address) store
                              ((church-force
                                 (cons 'a2118 address) store
                                 church-list)
                                (cons 'a2119 address) store
                                'b 'c 'd)
                              ((church-force
                                 (cons 'a2120 address) store
                                 church-list)
                                (cons 'a2121 address) store
                                0.1 0.6 0.3)))
                           (church-observe
                            (lambda (address store church-x)
                              (if (church-force
                                    (cons 'a2122 address)
                                    store
                                    ((church-force
                                       (cons 'a2123 address)
                                       store church-flip)
                                      (cons 'a2124 address)
                                      store 0.8))
                                  church-x
                                  'b))))
                    ((church-force (cons 'a2125 address)
                       store church-pair)
                      (cons 'a2126 address) store
                      ((church-force (cons 'a2127 address)
                         store church-eq?)
                        (cons 'a2128 address) store
                        ((church-force (cons 'a2129 address)
                           store church-observe)
                          (cons 'a2130 address) store
                          church-hyp)
                        'b)
                      (lambda (address store)
                        ((church-force (cons 'a2131 address)
                           store church-eq?)
                          (cons 'a2132 address) store
                          church-hyp 'b))))))))
          (lambda (address store church-x)
            (if (church-force (cons 'a2133 address) store
                  church-x)
                1
                0))
          0.357 church-error-tolerance
          "conditioned multinomial."))
      (church-force (cons 'a2134 address) store
        ((church-force (cons 'a2135 address) store
           church-check-test)
          (cons 'a2136 address) store
          ((church-force (cons 'a2137 address) store
             church-repeat)
            (cons 'a2138 address) store church-runs
            (lambda (address store)
              ((church-force (cons 'a2139 address) store
                 church-mh-query)
                (cons 'a2140 address) store church-samples
                church-lag
                (lambda (address store)
                  (letrec ((church-power-law
                            (lambda
                              (address store church-prob
                                church-x)
                              (if (church-force
                                    (cons 'a2141 address)
                                    store
                                    ((church-force
                                       (cons 'a2142 address)
                                       store church-flip)
                                      (cons 'a2143 address)
                                      store church-prob))
                                  church-x
                                  ((church-force
                                     (cons 'a2144 address)
                                     store church-power-law)
                                    (cons 'a2145 address)
                                    store church-prob
                                    ((church-force
                                       (cons 'a2146 address)
                                       store church-+)
                                      (cons 'a2147 address)
                                      store church-x 1)))))
                           (church-a
                            ((church-force
                               (cons 'a2148 address) store
                               church-power-law)
                              (cons 'a2149 address) store
                              0.3 1)))
                    ((church-force (cons 'a2150 address)
                       store church-pair)
                      (cons 'a2151 address) store
                      church-true
                      (lambda (address store)
                        ((church-force (cons 'a2152 address)
                           store church-<)
                          (cons 'a2153 address) store
                          church-a 5))))))))
          (lambda (address store church-x)
            (if (church-force (cons 'a2154 address) store
                  church-x)
                1
                0))
          ((church-force (cons 'a2155 address) store
             church-apply)
            (cons 'a2156 address) store church-+
            ((church-force (cons 'a2157 address) store
               (lambda (address store church-prob)
                 ((church-force (cons 'a2158 address) store
                    church-map)
                   (cons 'a2159 address) store
                   (lambda (address store church-x)
                     ((church-force (cons 'a2160 address)
                        store church-*)
                       (cons 'a2161 address) store
                       ((church-force (cons 'a2162 address)
                          store church-expt)
                         (cons 'a2163 address) store
                         ((church-force
                            (cons 'a2164 address) store
                            church--)
                           (cons 'a2165 address) store 1
                           church-prob)
                         ((church-force
                            (cons 'a2166 address) store
                            church--)
                           (cons 'a2167 address) store
                           church-x 1))
                       church-prob))
                   ((church-force (cons 'a2168 address)
                      store church-list)
                     (cons 'a2169 address) store 1 2 3 4))))
              (cons 'a2170 address) store 0.3))
          church-error-tolerance
          "recursive stochastic fn using define, unconditioned."))
      (church-force (cons 'a2171 address) store
        ((church-force (cons 'a2172 address) store
           church-check-test)
          (cons 'a2173 address) store
          ((church-force (cons 'a2174 address) store
             church-repeat)
            (cons 'a2175 address) store church-runs
            (lambda (address store)
              ((church-force (cons 'a2176 address) store
                 church-mh-query)
                (cons 'a2177 address) store church-samples
                church-lag
                (lambda (address store)
                  (letrec ((church-proc
                            ((lambda
                               (mem-address store proc)
                               (lambda
                                 (address store . args)
                                 (church-apply
                                   (cons args mem-address)
                                   store proc args)))
                              address store
                              (lambda
                                (address store church-x)
                                ((church-force
                                   (cons 'a2178 address)
                                   store church-flip)
                                  (cons 'a2179 address)
                                  store 0.8)))))
                    ((church-force (cons 'a2180 address)
                       store church-pair)
                      (cons 'a2181 address) store
                      church-true
                      (lambda (address store)
                        ((church-force (cons 'a2182 address)
                           store church-and)
                          (cons 'a2183 address) store
                          ((church-force
                             (cons 'a2184 address) store
                             church-proc)
                            (cons 'a2185 address) store 1)
                          ((church-force
                             (cons 'a2186 address) store
                             church-proc)
                            (cons 'a2187 address) store 2)
                          ((church-force
                             (cons 'a2188 address) store
                             church-proc)
                            (cons 'a2189 address) store 1)
                          ((church-force
                             (cons 'a2190 address) store
                             church-proc)
                            (cons 'a2191 address) store 2)))))))))
          (lambda (address store church-x)
            (if (church-force (cons 'a2192 address) store
                  church-x)
                1
                0))
          0.64 church-error-tolerance
          "memoized flip, unconditioned."))
      (church-force (cons 'a2193 address) store
        ((church-force (cons 'a2194 address) store
           church-check-test)
          (cons 'a2195 address) store
          ((church-force (cons 'a2196 address) store
             church-repeat)
            (cons 'a2197 address) store church-runs
            (lambda (address store)
              ((church-force (cons 'a2198 address) store
                 church-mh-query)
                (cons 'a2199 address) store church-samples
                church-lag
                (lambda (address store)
                  (letrec ((church-proc
                            ((lambda
                               (mem-address store proc)
                               (lambda
                                 (address store . args)
                                 (church-apply
                                   (cons args mem-address)
                                   store proc args)))
                              address store
                              (lambda
                                (address store church-x)
                                ((church-force
                                   (cons 'a2200 address)
                                   store church-flip)
                                  (cons 'a2201 address)
                                  store 0.2)))))
                    ((church-force (cons 'a2202 address)
                       store church-pair)
                      (cons 'a2203 address) store
                      ((church-force (cons 'a2204 address)
                         store church-or)
                        (cons 'a2205 address) store
                        ((church-force (cons 'a2206 address)
                           store church-proc)
                          (cons 'a2207 address) store 1)
                        ((church-force (cons 'a2208 address)
                           store church-proc)
                          (cons 'a2209 address) store 2)
                        ((church-force (cons 'a2210 address)
                           store church-proc)
                          (cons 'a2211 address) store 2)
                        ((church-force (cons 'a2212 address)
                           store church-proc)
                          (cons 'a2213 address) store 2))
                      (lambda (address store)
                        ((church-force (cons 'a2214 address)
                           store church-proc)
                          (cons 'a2215 address) store 1))))))))
          (lambda (address store church-x)
            (if (church-force (cons 'a2216 address) store
                  church-x)
                1
                0))
          ((church-force (cons 'a2217 address) store
             church-/)
            (cons 'a2218 address) store
            ((church-force (cons 'a2219 address) store
               church-+)
              (cons 'a2220 address) store
              ((church-force (cons 'a2221 address) store
                 church-*)
                (cons 'a2222 address) store 0.2 0.2)
              ((church-force (cons 'a2223 address) store
                 church-*)
                (cons 'a2224 address) store 0.2 0.8))
            ((church-force (cons 'a2225 address) store
               church-+)
              (cons 'a2226 address) store
              ((church-force (cons 'a2227 address) store
                 church-*)
                (cons 'a2228 address) store 0.2 0.2)
              ((church-force (cons 'a2229 address) store
                 church-*)
                (cons 'a2230 address) store 0.2 0.8)
              ((church-force (cons 'a2231 address) store
                 church-*)
                (cons 'a2232 address) store 0.8 0.2)))
          church-error-tolerance
          "memoized flip, conditioned."))
      (church-force (cons 'a2233 address) store
        ((church-force (cons 'a2234 address) store
           church-check-test)
          (cons 'a2235 address) store
          ((church-force (cons 'a2236 address) store
             church-repeat)
            (cons 'a2237 address) store church-runs
            (lambda (address store)
              ((church-force (cons 'a2238 address) store
                 church-mh-query)
                (cons 'a2239 address) store church-samples
                church-lag
                (lambda (address store)
                  (letrec ((church-a
                            ((church-force
                               (cons 'a2240 address) store
                               church-flip)
                              (cons 'a2241 address) store
                              0.8))
                           (church-proc
                            ((lambda
                               (mem-address store proc)
                               (lambda
                                 (address store . args)
                                 (church-apply
                                   (cons args mem-address)
                                   store proc args)))
                              address store
                              (lambda
                                (address store church-x)
                                church-a))))
                    ((church-force (cons 'a2242 address)
                       store church-pair)
                      (cons 'a2243 address) store
                      church-true
                      (lambda (address store)
                        ((church-force (cons 'a2244 address)
                           store church-and)
                          (cons 'a2245 address) store
                          ((church-force
                             (cons 'a2246 address) store
                             church-proc)
                            (cons 'a2247 address) store 1)
                          ((church-force
                             (cons 'a2248 address) store
                             church-proc)
                            (cons 'a2249 address) store 1)))))))))
          (lambda (address store church-x)
            (if (church-force (cons 'a2250 address) store
                  church-x)
                1
                0))
          0.8 church-error-tolerance
          "bound symbol used inside memoizer, unconditioned."))
      (church-force (cons 'a2251 address) store
        ((church-force (cons 'a2252 address) store
           church-check-test)
          (cons 'a2253 address) store
          ((church-force (cons 'a2254 address) store
             church-repeat)
            (cons 'a2255 address) store church-runs
            (lambda (address store)
              ((church-force (cons 'a2256 address) store
                 church-mh-query)
                (cons 'a2257 address) store church-samples
                church-lag
                (lambda (address store)
                  (letrec ((church-proc
                            ((lambda
                               (mem-address store proc)
                               (lambda
                                 (address store . args)
                                 (church-apply
                                   (cons args mem-address)
                                   store proc args)))
                              address store
                              (lambda
                                (address store church-x)
                                ((church-force
                                   (cons 'a2258 address)
                                   store church-flip)
                                  (cons 'a2259 address)
                                  store 0.8)))))
                    ((church-force (cons 'a2260 address)
                       store church-pair)
                      (cons 'a2261 address) store
                      church-true
                      (lambda (address store)
                        ((church-force (cons 'a2262 address)
                           store church-and)
                          (cons 'a2263 address) store
                          ((church-force
                             (cons 'a2264 address) store
                             church-proc)
                            (cons 'a2265 address) store
                            ((church-force
                               (cons 'a2266 address) store
                               church-uniform-draw)
                              (cons 'a2267 address) store
                              ((church-force
                                 (cons 'a2268 address) store
                                 church-list)
                                (cons 'a2269 address) store
                                1 2 3)))
                          ((church-force
                             (cons 'a2270 address) store
                             church-proc)
                            (cons 'a2271 address) store
                            ((church-force
                               (cons 'a2272 address) store
                               church-uniform-draw)
                              (cons 'a2273 address) store
                              ((church-force
                                 (cons 'a2274 address) store
                                 church-list)
                                (cons 'a2275 address) store
                                1 2 3)))))))))))
          (lambda (address store church-x)
            (if (church-force (cons 'a2276 address) store
                  church-x)
                1
                0))
          ((church-force (cons 'a2277 address) store
             church-+)
            (cons 'a2278 address) store
            ((church-force (cons 'a2279 address) store
               church-*)
              (cons 'a2280 address) store
              ((church-force (cons 'a2281 address) store
                 church-/)
                (cons 'a2282 address) store 1 3)
              0.8)
            ((church-force (cons 'a2283 address) store
               church-*)
              (cons 'a2284 address) store
              ((church-force (cons 'a2285 address) store
                 church-/)
                (cons 'a2286 address) store 2 3)
              ((church-force (cons 'a2287 address) store
                 church-*)
                (cons 'a2288 address) store 0.8 0.8)))
          church-error-tolerance
          "memoized flip with random argument, unconditioned."))
      (church-force (cons 'a2289 address) store
        ((church-force (cons 'a2290 address) store
           church-check-test)
          (cons 'a2291 address) store
          ((church-force (cons 'a2292 address) store
             church-repeat)
            (cons 'a2293 address) store church-runs
            (lambda (address store)
              ((church-force (cons 'a2294 address) store
                 church-mh-query)
                (cons 'a2295 address) store church-samples
                church-lag
                (lambda (address store)
                  (letrec ((church-proc
                            (if (church-force
                                  (cons 'a2296 address)
                                  store
                                  ((church-force
                                     (cons 'a2297 address)
                                     store church-flip)
                                    (cons 'a2298 address)
                                    store 0.7))
                                (lambda
                                  (address store church-x)
                                  ((church-force
                                     (cons 'a2299 address)
                                     store church-flip)
                                    (cons 'a2300 address)
                                    store 0.2))
                                (lambda
                                  (address store church-x)
                                  ((church-force
                                     (cons 'a2301 address)
                                     store church-flip)
                                    (cons 'a2302 address)
                                    store 0.8))))
                           (church-memproc
                            ((lambda
                               (mem-address store proc)
                               (lambda
                                 (address store . args)
                                 (church-apply
                                   (cons args mem-address)
                                   store proc args)))
                              address store church-proc)))
                    ((church-force (cons 'a2303 address)
                       store church-pair)
                      (cons 'a2304 address) store
                      church-true
                      (lambda (address store)
                        ((church-force (cons 'a2305 address)
                           store church-and)
                          (cons 'a2306 address) store
                          ((church-force
                             (cons 'a2307 address) store
                             church-memproc)
                            (cons 'a2308 address) store 1)
                          ((church-force
                             (cons 'a2309 address) store
                             church-memproc)
                            (cons 'a2310 address) store 2)))))))))
          (lambda (address store church-x)
            (if (church-force (cons 'a2311 address) store
                  church-x)
                1
                0))
          ((church-force (cons 'a2312 address) store
             church-+)
            (cons 'a2313 address) store
            ((church-force (cons 'a2314 address) store
               church-*)
              (cons 'a2315 address) store 0.7 0.2 0.2)
            ((church-force (cons 'a2316 address) store
               church-*)
              (cons 'a2317 address) store 0.3 0.8 0.8))
          church-error-tolerance
          "memoized random procedure, unconditioned."))
      (church-force (cons 'a2318 address) store
        ((church-force (cons 'a2319 address) store
           church-check-test)
          (cons 'a2320 address) store
          ((church-force (cons 'a2321 address) store
             church-repeat)
            (cons 'a2322 address) store church-runs
            (lambda (address store)
              ((church-force (cons 'a2323 address) store
                 church-mh-query)
                (cons 'a2324 address) store church-samples
                church-lag
                (lambda (address store)
                  (letrec ((church-bit-flip
                            (lambda
                              (address store church-fidelity
                                church-x)
                              ((church-force
                                 (cons 'a2325 address) store
                                 church-flip)
                                (cons 'a2326 address) store
                                (if (church-force
                                      (cons 'a2327 address)
                                      store church-x)
                                    church-fidelity
                                    ((church-force
                                       (cons 'a2328 address)
                                       store church--)
                                      (cons 'a2329 address)
                                      store 1
                                      church-fidelity))))))
                    ((church-force (cons 'a2330 address)
                       store church-pair)
                      (cons 'a2331 address) store
                      church-true
                      (lambda (address store)
                        ((church-force (cons 'a2332 address)
                           store church-rejection-query)
                          (cons 'a2333 address) store
                          (lambda (address store)
                            (letrec ((church-a
                                      ((church-force
                                         (cons 'a2334
                                           address)
                                         store church-flip)
                                        (cons 'a2335 address)
                                        store 0.7)))
                              ((church-force
                                 (cons 'a2336 address) store
                                 church-pair)
                                (cons 'a2337 address) store
                                ((church-force
                                   (cons 'a2338 address)
                                   store church-bit-flip)
                                  (cons 'a2339 address)
                                  store 0.8 church-a)
                                (lambda (address store)
                                  church-a))))))))))))
          (lambda (address store church-x)
            (if (church-force (cons 'a2340 address) store
                  church-x)
                1
                0))
          ((church-force (cons 'a2341 address) store
             church-/)
            (cons 'a2342 address) store
            ((church-force (cons 'a2343 address) store
               church-*)
              (cons 'a2344 address) store 0.7 0.8)
            ((church-force (cons 'a2345 address) store
               church-+)
              (cons 'a2346 address) store
              ((church-force (cons 'a2347 address) store
                 church-*)
                (cons 'a2348 address) store 0.7 0.8)
              ((church-force (cons 'a2349 address) store
                 church-*)
                (cons 'a2350 address) store 0.3 0.2)))
          church-error-tolerance
          "mh-query over rejection query for conditioned flip."))
      (church-force (cons 'a2351 address) store
        ((church-force (cons 'a2352 address) store
           church-check-test)
          (cons 'a2353 address) store
          ((church-force (cons 'a2354 address) store
             church-repeat)
            (cons 'a2355 address) store church-runs
            (lambda (address store)
              ((church-force (cons 'a2356 address) store
                 church-mh-query)
                (cons 'a2357 address) store church-samples
                church-lag
                (lambda (address store)
                  (letrec ((church-a
                            (if (church-force
                                  (cons 'a2358 address)
                                  store
                                  ((church-force
                                     (cons 'a2359 address)
                                     store church-flip)
                                    (cons 'a2360 address)
                                    store 0.9))
                                ((church-force
                                   (cons 'a2361 address)
                                   store church-first)
                                  (cons 'a2362 address)
                                  store
                                  ((church-force
                                     (cons 'a2363 address)
                                     store church-beta)
                                    (cons 'a2364 address)
                                    store 1 5))
                                0.7))
                           (church-b
                            ((church-force
                               (cons 'a2365 address) store
                               church-flip)
                              (cons 'a2366 address) store
                              church-a)))
                    ((church-force (cons 'a2367 address)
                       store church-pair)
                      (cons 'a2368 address) store church-b
                      (lambda (address store) church-a)))))))
          (lambda (address store church-x) church-x) 0.417
          church-error-tolerance "trans-dimensional."))
      (church-force (cons 'a2369 address) store
        ((church-force (cons 'a2370 address) store
           church-check-test)
          (cons 'a2371 address) store
          ((church-force (cons 'a2372 address) store
             church-repeat)
            (cons 'a2373 address) store church-runs
            (lambda (address store)
              ((church-force (cons 'a2374 address) store
                 church-mh-query)
                (cons 'a2375 address) store church-samples
                church-lag
                (lambda (address store)
                  (letrec ((church-a
                            (if (church-force
                                  (cons 'a2376 address)
                                  store
                                  ((church-force
                                     (cons 'a2377 address)
                                     store church-flip)
                                    (cons 'a2378 address)
                                    store))
                                ((lambda
                                   (mem-address store proc)
                                   (lambda
                                     (address store . args)
                                     (church-apply
                                       (cons args
                                         mem-address)
                                       store proc args)))
                                  address store church-flip)
                                ((lambda
                                   (mem-address store proc)
                                   (lambda
                                     (address store . args)
                                     (church-apply
                                       (cons args
                                         mem-address)
                                       store proc args)))
                                  address store church-flip)))
                           (church-b
                            ((church-force
                               (cons 'a2379 address) store
                               church-a)
                              (cons 'a2380 address) store)))
                    ((church-force (cons 'a2381 address)
                       store church-pair)
                      (cons 'a2382 address) store
                      church-true
                      (lambda (address store) church-b)))))))
          (lambda (address store church-x)
            (if (church-force (cons 'a2383 address) store
                  church-x)
                1
                0))
          0.5 church-error-tolerance
          "memoized flip in if branch (create/destroy memprocs), unconditioned."))
      "tests done!")))

;;seed the random number generator
(randomize-rng)

(define time-start (current-time))

(display
(church-main '(top) (make-empty-store))
) (newline)
;;done

(define time-end (current-time))
(display "Time for Bher (precompiled): ")
(display (- (time-second time-end) (time-second time-start)))
(newline)