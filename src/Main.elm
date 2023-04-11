module Main exposing (main)

import Browser
import Html.Styled exposing (Html, div, img)
import Html.Styled.Attributes exposing (src, style)
import VitePluginHelper

type Msg = NoOp


main : Program () Int Msg
main =
    Browser.sandbox { init = 0, update = update, view = view >> Html.Styled.toUnstyled }



update : Msg -> number -> number
update msg model =
    case msg of
        NoOp -> model


view : Int -> Html Msg
view model =
    div []
        [ img [ src <| VitePluginHelper.asset "/src/assets/logo.png", style "width" "300px" ] []
        ]
