{:jvm-opts ["-Xmx2g"]
 :repl {:plugins [[cider/cider-nrepl "0.28.5"]
                  [refactor-nrepl "2.5.5" :exclusions [nrepl org.clojure/tools.logging]]
                  [mvxcvi/whidbey "2.2.1"]]
        :middleware [whidbey.plugin/repl-pprint]}}
