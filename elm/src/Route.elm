module Route exposing (Report(..), Route(..), decode, encode)

import Navigation exposing (Location)
import UrlParser as Url exposing ((</>), s)
import Uuid exposing (Uuid)


type Report
    = Detail
    | Rejection
    | ServiceCall
    | ApplicationMovement
    | ApplicationActivity


type Route
    = Home
    | ApplicationList
    | Application Uuid
    | Report Report
    | ProductIndicator -- TODO
    | Dictionary -- TODO
    | NotFound


decode : Location -> Route
decode location =
    Url.parseHash routeParser location
        |> Maybe.withDefault NotFound


routeParser : Url.Parser (Route -> a) a
routeParser =
    Url.oneOf
        [ Url.map Home Url.top
        , Url.map ApplicationList <| s "application"
        , Url.map Application <| s "application" </> uuid
        , Url.map (Report <| Detail) <| s "report/detail"
        , Url.map (Report <| Rejection) <| s "report/rejection"
        , Url.map (Report <| ServiceCall) <| s "report/service-call"
        , Url.map (Report <| ApplicationMovement) <| s "report/application-movement"
        , Url.map (Report <| ApplicationActivity) <| s "report/application-activity"
        , Url.map ProductIndicator <| s "product-indicator"
        , Url.map Dictionary <| s "dictionary"
        ]


encode : Route -> String
encode route =
    "#"
        ++ (case route of
                Home ->
                    ""

                ApplicationList ->
                    "application"

                Application uuid ->
                    "application/" ++ Uuid.toString uuid

                Report Detail ->
                    "report/detail"

                Report Rejection ->
                    "report/rejection"

                Report ServiceCall ->
                    "report/service-call"

                Report ApplicationMovement ->
                    "report/application-movement"

                Report ApplicationActivity ->
                    "report/application-activity"

                ProductIndicator ->
                    "product-indicator"

                Dictionary ->
                    "dictionary"

                NotFound ->
                    "not-found"
           )


uuid : Url.Parser (Uuid -> a) a
uuid =
    Url.custom "UUID" (Result.fromMaybe "Not UUID" << Uuid.fromString)
