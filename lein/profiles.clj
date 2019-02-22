{:user {:jvm-opts ["-Xmx2g"]}
 :repl {:plugins [[refactor-nrepl "2.4.0"]
                  [cider/cider-nrepl "0.20.0"]
                  [mvxcvi/whidbey "2.0.0"]]
        :middleware [cider-nrepl.plugin/middleware
                     refactor-nrepl.plugin/middleware
                     whidbey.plugin/repl-pprint]}}
