module Auth exposing (..)

import Bootstrap.Button as Button
import Bootstrap.Form.Input as Input
import Html exposing (..)


type Role
    = Admin
    | Attract
    | Declare
    | Verify
    | Pledgerate
    | Lawyer
    | Security
    | Risk
    | Retailcom
    | Creditcom
    | Middle
    | Signing
    | Pledgereg
    | Creditadmin


type Model
    = Anonymous
        { login : String
        , password : String
        }
    | Authenticated
        { login : String
        , role : Role
        , availableRoles : List Role
        }


type alias State =
    Model


type Msg
    = LogIn String String
    | LogOut


init : State
init =
    Anonymous { login = "", password = "" }


update : Msg -> Model -> Model
update msg model =
    case ( msg, model ) of
        ( LogIn login password, Anonymous _ ) ->
            Authenticated { login = login, role = Admin, availableRoles = [ Admin ] }

        ( LogOut, Authenticated { login, role, availableRoles } ) ->
            Anonymous { login = login, password = "" }

        _ ->
            model



-- TODO


view : (Msg -> msg) -> Model -> List (Html msg)
view msg model =
    case model of
        Anonymous { login, password } ->
            [ Input.text [ Input.placeholder "login" ]
            , Input.password []
            , Button.button [ Button.onClick <| msg <| LogIn login password ] [ text "Login" ]
            ]

        Authenticated { login, role, availableRoles } ->
            [ Html.text login
            , Button.button [ Button.onClick <| msg <| LogOut ] [ text "Log out" ]
            , Html.text <| toString role
            ]
