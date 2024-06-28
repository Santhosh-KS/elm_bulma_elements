module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes as Attr


type MainMsg
    = None


type alias Model =
    { heroModel : HeroModel }


type alias HeroModel =
    { image : String
    , title : String
    , subTitle : String
    }


heroContent : HeroModel
heroContent =
    { image = "./assets/trophyLogo.png"
    , title = ""
    , subTitle = "A Community for Creative Engineers.."
    }


view : Model -> Html MainMsg
view model =
    Html.div []
        [ hero model.heroModel ]


hero : HeroModel -> Html MainMsg
hero model =
    Html.section [ Attr.class "hero is-success has-text-centered" ]
        [ Html.div [ Attr.class "hero-body" ]
            [ -- star
              Html.img
                [ Attr.src model.image ]
                []
            , Html.p
                [ Attr.class "title"
                ]
                [ Html.text model.title ]
            , Html.p
                [ Attr.class "subtitle "
                ]
                [ Html.text model.subTitle ]
            ]
        ]


type Flags
    = NoFlag


init : () -> ( Model, Cmd msg )
init flags =
    ( { heroModel = heroContent }, Cmd.none )


subscriptions : Model -> Sub MainMsg
subscriptions model =
    Sub.none


update : MainMsg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        None ->
            ( model, Cmd.none )


main : Program () Model MainMsg
main =
    Browser.element
        { init = init
        , view = view
        , subscriptions = subscriptions
        , update = update
        }
