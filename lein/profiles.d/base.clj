{:jvm-opts ["-Xmx2g"]
 :plugins [[cider/cider-nrepl "0.53.2" :exclusions [nrepl]]
           [nrepl "1.3.1"]
           [refactor-nrepl "3.10.0" :exclusions [nrepl org.clojure/tools.logging]]
           [mvxcvi/whidbey "2.2.1"]]
 :middleware [whidbey.plugin/repl-pprint]}
