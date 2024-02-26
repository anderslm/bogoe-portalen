module Portalen.Server.Index

open Bolero
open Bolero.Html
open Bolero.Server.Html
open Portalen

let page = doctypeHtml {
    head {
        meta { attr.charset "UTF-8" }
        meta { attr.name "viewport"; attr.content "width=device-width, initial-scale=1.0" }
        title { "Bogø Portalen" }
        ``base`` { attr.href "/" }
        link { attr.rel "stylesheet"; attr.href "css/bootstrap.min.css" }
        link { attr.rel "stylesheet"; attr.href "styles.css" }
        script { attr.src "js/bootstrap.bundle.min.js" }
        script { attr.src "js/blocs.js" }
        script { attr.src "js/lazysizes.min.js" }
    }
    body {
        div { attr.id "main"; comp<Client.Main.MyApp> }
        boleroScript
    }
}
