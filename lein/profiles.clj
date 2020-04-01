{:user {:jvm-opts   ["-Xmx2g"]
        :plugins    [[cider/cider-nrepl "0.21.1"]
                     [lein-nvd "1.3.1"]
                     [mvxcvi/whidbey "2.1.0"]
                     [nrepl "0.6.0"]
                     [refactor-nrepl "2.4.1-SNAPSHOT" :exclusions [nrepl org.clojure/tools.logging]]]
        :middleware [whidbey.plugin/repl-pprint]}}
