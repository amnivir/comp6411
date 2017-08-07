




        (setq d_influenza '(influenza fever cough sore_throat runny_nose muscle_ache      
                            body_ache headaches fatigue))
                            
        (setq d_aids '(aids fever chills rash night_sweats muscle_ache sore_throat fatigue 
                        swollen_lymph_nodes mouth_ulcers))
                        
        (setq d_hepatitisC '(hepatitisC nausea vomiting stomach_pain muscle_pain             
                            urine_abnormality bowel_movements_abnormality skin_yellowing eyes_yellowing))
                            
        (setq d_pregnancy '(pregnancy mild_cramping_spotting missed_period fatigue  
                            nausea tingling_breasts aching_breasts frequent_urination bloating motion_sickness mood_swings temperature_changes high_blood_pressure extreme_fatigue heartburn faster_heartbeat breast_changes nipple_changes acne noticeable_weight_gain pregnancy_glow))
        
        (setq d_all (list d_influenza d_aids d_hepatitisC d_pregnancy))
        
        (setq ad '(night_sweats))
                            
        (defun diseaseInsersection(lst)
        (cond ((null lst) nil)
        (t  (setq desease_freq (cons (* 100 (float(/ (list-length (intersection ad (cdr (car lst)))) (list-length(cdr (car lst))))))  (diseaseInsersection (cdr lst) ) )))))

        (diseaseInsersection d_all )
                        
        (defun diseaseList (d_all)
        (cond ((null d_all) nil)
             (t(cons (car (car d_all)) (diseaseList (cdr d_all))))))
             
        (setq disease_list(diseaseList d_all))
        
        
        (setq disease_list_freq_pair (pairlis desease_freq disease_list))
        
        (print disease_list_freq_pair)
        
    
        (sort  disease_list_freq_pair #'(lambda (a b) (> (car a) (car b))))
        (print disease_list_freq_pair)

   
        (setq  cmd_args  (list (format t "~&~S~&" *args*)))
                    
        (defun parseArg (str)
            (cond ((null str) nil)
            (t(print (with-input-from-string (s (car str))
   (let ((r nil))
      (do ((line (read s nil 'eof)
                 (read s nil 'eof)))
          ((eql line 'eof))
          (push line r))
   (reverse r)))  parseArg (cdr str)))))
               
        (print cmd_args) 
                
