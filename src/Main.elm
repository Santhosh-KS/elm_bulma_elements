module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes as Attr exposing (value)
import Url.Builder exposing (string)


type MainMsg
    = None


type alias Model =
    { heroModel : HeroModel }



-- INIT


init : () -> ( Model, Cmd msg )
init flags =
    ( { heroModel = heroContent }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub MainMsg
subscriptions model =
    Sub.none



-- UPDATE


update : MainMsg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        None ->
            ( model, Cmd.none )



-- MAIN


main : Program () Model MainMsg
main =
    Browser.element
        { init = init
        , view = view
        , subscriptions = subscriptions
        , update = update
        }



-- VIEW


view : Model -> Html MainMsg
view model =
    Html.div []
        [ hero model.heroModel ]



-- HERO


type alias HeroModel =
    { image : String
    , title : String
    , subTitle : String
    , navBarModel : NavBarModel
    }


heroContent : HeroModel
heroContent =
    { image = "./assets/trophyLogo.png"
    , title = ""
    , subTitle = "A Community for Creative Engineers.."
    , navBarModel = { image = "./assets/vbuntuText1080X260.png", width = 120, menuItems = [ "Home", "Examples", "Documentation" ] }
    }


heroHead : HeroModel -> Html MainMsg
heroHead model =
    Html.div [ Attr.class "hero-head" ] [ navBar model.navBarModel ]


hero : HeroModel -> Html MainMsg
hero model =
    Html.section [ Attr.class "hero is-gray is-fullheight " ]
        [ heroHead model
        , heroBody model
        , heroFooter model
        ]


heroBody : HeroModel -> Html MainMsg
heroBody model =
    Html.div [ Attr.class "hero-body" ]
        [ Html.div [ Attr.class "container has-text-centered" ]
            [ Html.img [ Attr.src model.image ] []
            , stringToPtag "title" model.title
            , stringToPtag "subtitle" model.subTitle
            ]
        ]


heroFooter : HeroModel -> Html MainMsg
heroFooter model =
    Html.div [ Attr.class "hero-footer" ]
        [ Html.nav [ Attr.class "tabs is-boxed is-fullwidth" ]
            [ Html.div [ Attr.class "container" ]
                [ Html.ul []
                    [ Html.li [ Attr.class "is-active" ] [ stringToAtag "" "Overview" ]
                    , Html.li [] [ stringToAtag "" "Grid" ]
                    , Html.li [] [ stringToAtag "" "Elements" ]
                    , Html.li [] [ stringToAtag "" "Components" ]
                    , Html.li [] [ stringToAtag "" "Layouts" ]
                    ]
                ]
            ]
        ]



-- NAVBAR


type alias NavBarModel =
    { image : String
    , width : Int
    , menuItems : List String
    }


spanGen : Int -> Html MainMsg
spanGen _ =
    Html.span [] []


navBarBurger : Html MainMsg
navBarBurger =
    let
        s =
            List.map spanGen (List.repeat 4 1)
    in
    Html.span [ Attr.class "navbar-burger" ] s


navBarLogo : NavBarModel -> Html MainMsg
navBarLogo model =
    Html.a [ Attr.class "navbar-item" ]
        [ Html.img
            [ Attr.src model.image
            , Attr.width model.width
            ]
            []
        ]


navBarBrand : NavBarModel -> Html MainMsg
navBarBrand model =
    Html.div [ Attr.class "navbar-brand" ]
        [ navBarLogo model
        , navBarBurger
        ]


navBar : NavBarModel -> Html MainMsg
navBar model =
    Html.header [ Attr.class "navbar" ]
        [ Html.div [ Attr.class "container" ]
            [ navBarBrand model
            , navBarMenu model
            ]
        ]


stringToAtag : String -> String -> Html MainMsg
stringToAtag className value =
    Html.a [ Attr.class className ]
        [ Html.text value ]


stringToPtag : String -> String -> Html MainMsg
stringToPtag className value =
    Html.p [ Attr.class className ]
        [ Html.text value ]


stringToLitag : String -> String -> Html MainMsg
stringToLitag className value =
    Html.li [ Attr.class className ]
        [ Html.text value ]


gitHubButton : Html MainMsg
gitHubButton =
    Html.span [ Attr.class "navbar-item" ]
        [ Html.a [ Attr.class "button is-success is-inverted" ]
            [ Html.span [ Attr.class "icon" ]
                [ Html.i [ Attr.class "fab fa-github" ] []
                ]
            , Html.span
                []
                [ Html.text "Download" ]
            ]
        ]


navBarMenu : NavBarModel -> Html MainMsg
navBarMenu model =
    Html.div [ Attr.class "navbar-menu" ]
        [ Html.div [ Attr.class "navbar-end" ]
            [ stringToAtag "navbar-item is-active" "Home"
            , stringToAtag "navbar-item " "Examples"
            , stringToAtag "navbar-item " "Documents"
            , gitHubButton
            ]
        ]
