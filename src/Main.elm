module Main exposing (main)

import Browser
import Css
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Html.Styled.Events exposing (..)
import VitePluginHelper

type Msg = UpdateNewTodo String | SubmitTodo
type alias Model = { newTodo : String, todos: List Todo }
type alias Todo = { task : String, completed : Bool }


main : Program () Model Msg
main =
    Browser.sandbox { init = { newTodo = "I work!"
                    , todos = []}, update = update
                    , view = view >> Html.Styled.toUnstyled }



update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateNewTodo todo -> {model | newTodo = todo }
        SubmitTodo -> {model | todos = (model.todos ++ [ { task = model.newTodo, completed = False } ]), newTodo = "" }


view : Model -> Html Msg
view model =
    div [css [Css.maxWidth (Css.ch 40)]]
        [ 
            ul [] 
                (List.map (\todo -> li [] [text todo.task]) model.todos)
            ,Html.Styled.form [ onSubmit SubmitTodo ] [
            input [value model.newTodo, onInput UpdateNewTodo] []
            ,button [type_"submit" ] [text "Submit"]
            ]
        ]
