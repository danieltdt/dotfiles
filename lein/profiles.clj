{:user {:plugins [[refactor-nrepl "2.4.0"]
                  [cider/cider-nrepl "0.20.0"]]
        :middleware [cider-nrepl.plugin/middleware
                     refactor-nrepl.plugin/middleware]
        :jvm-opts ["-Xmx300m"]}}
