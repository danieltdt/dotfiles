{:user {:jvm-opts ["-Xmx2g"]}
 :repl {:plugins    [[cider/cider-nrepl "0.20.0"]
                     [org.clojure/tools.nrepl "0.2.13"]
                     [refactor-nrepl "2.4.0"]
                     [mvxcvi/whidbey "2.0.0"]]
        :middleware [cider-nrepl.plugin/middleware
                     refactor-nrepl.plugin/middleware
                     whidbey.plugin/middleware]}}
