{:user {:jvm-opts   ["-Xmx2g"]
        :plugins    [[cider/cider-nrepl "0.21.1"]
                     [nrepl "0.6.0"]
                     [refactor-nrepl "2.4.1-SNAPSHOT" :exclusions [nrepl org.clojure/tools.logging]]
                     [mvxcvi/whidbey "2.1.0"]]
        :middleware [whidbey.plugin/repl-pprint]}}
