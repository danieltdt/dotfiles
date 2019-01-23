{:user {:plugins [[refactor-nrepl "2.4.0"]
                  [cider/cider-nrepl "0.20.0"]]
                  ;;[org.clojure/tools.nrepl "0.2.13"]
                  ;;[clojure-complete "0.2.5"]]
        :middleware [cider-nrepl.plugin/middleware
                     refactor-nrepl.plugin/middleware]
        :jvm-opts ["-Xmx2g"]}}
