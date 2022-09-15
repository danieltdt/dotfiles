{:jvm-opts ["-Xmx2g"]
 :plugins [[cider/cider-nrepl "0.28.5" :exclusions [nrepl]]
           [nrepl "1.0.0"]
           [refactor-nrepl "3.5.5" :exclusions [nrepl org.clojure/tools.logging]]
           [mvxcvi/whidbey "2.2.1"]]
 :middleware [whidbey.plugin/repl-pprint]}
