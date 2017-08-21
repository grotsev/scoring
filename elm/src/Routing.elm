module Routing exposing (Route(..), parseLocation)

import Navigation exposing (Location)
import UrlParser as Url exposing ((</>), s)
import Uuid exposing (Uuid)


type Route
    = Home
    | ApplicationList
    | Application Uuid
    | Report -- TODO
    | Dictionary -- TODO
    | NotFound


parseLocation : Location -> Route
parseLocation location =
    Url.parseHash routeParser location
        |> Maybe.withDefault NotFound


routeParser : Url.Parser (Route -> a) a
routeParser =
    Url.oneOf
        [ Url.map Home Url.top
        , Url.map ApplicationList <| s "application"
        , Url.map Application <| s "application" </> uuid
        , Url.map Report <| s "report"
        , Url.map Dictionary <| s "dictionary"
        ]


uuid : Url.Parser (Uuid -> a) a
uuid =
    Url.custom "UUID" (Result.fromMaybe "Not UUID" << Uuid.fromString)
