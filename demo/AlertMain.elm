module AlertMain exposing (main)

import Html exposing (Html, program, text, div, h1, h2, h3, h4, a, p, nav, ul, li)
import Html.Attributes exposing (attribute, class, href)
import Html.Events exposing (onClick)
import Alert exposing (..)


-- MODEL

{-}
type alias Model =
    { alerts : Alert.State
    }



-- MSG


type Msg
    = NoOp
    | OpenAlert String
    | AlertMsg Alert.Msg



-- INIT


init : ( Model, Cmd Msg )
init =
    ( { alerts = Alert.init }, Cmd.none )



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        OpenAlert domId ->
            let
                ( nextState, alertCmd ) =
                    Alert.open domId model.alerts
            in
                ( { model | alerts = nextState }, alertCmd )

        AlertMsg subMsg ->
            ( { model | alerts = Alert.update subMsg model.alerts }, Cmd.none )



-- VIEW


infoAlertConfig : Alert.Config
infoAlertConfig =
    { domId = "alert-info"
    , severity = Info
    , dismssal = DismissAfter 5
    , summary = "You just clicked something. Hurray!"
    , details = Just "And you expanded the details content. Double hurray!"
    }


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ div [ class "header clearfix" ]
            [ nav []
                [ ul [ class "nav nav-pills pull-right" ]
                    [ li [ class "active", attribute "role" "presentation" ]
                        [ a [ href "#" ]
                            [ text "Home" ]
                        ]
                    , li [ attribute "role" "presentation" ]
                        [ a [ href "#" ]
                            [ text "About" ]
                        ]
                    , li [ attribute "role" "presentation" ]
                        [ a [ href "#" ]
                            [ text "Contact" ]
                        ]
                    ]
                ]
            , h3 [ class "text-muted" ]
                [ text "CSS Transitions in Elm" ]
            ]
        , Alert.view infoAlertConfig model.alerts
            |> Html.map AlertMsg
        , div [ class "jumbotron" ]
            [ h2 []
                [ text "Alert Example" ]
            , p [ class "lead" ]
                [ text "Cras justo odio, dapibus ac facilisis in, egestas eget quam. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus." ]
            , p []
                [ a
                    [ class "btn btn-lg btn-success"
                    , href "#"
                    , attribute "role" "button"
                    , onClick (OpenAlert infoAlertConfig.domId)
                    ]
                    [ text "Click me" ]
                ]
            ]
        , div [ class "row marketing" ]
            [ h3 []
                [ text "Alerts need to use ports" ]
            , p []
                [ text "Donec id elit non mi porta gravida at eget metus. Maecenas faucibus mollis interdum." ]
            ]
        ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- PROGRAM


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }
