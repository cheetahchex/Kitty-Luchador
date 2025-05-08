
function Show-LuchadorMask {
@"
     /\        /\
    /  \______/  \
  ╭──────────────╮
 /   ╭──┬──╮      \
|   │ ●││● │       |
|   ╰──┴──╯       │
|   ╭──┬──╮       │
 \  ╰╮╰┴╯╭╯      /
  ╰──────────────╯
  ╭──┬────────┬──╮
 │ ╭╯   EL     ╰╮ │
 │ │  GATO      │ │
 │ ╰╮ SUPREMO ╭╯ │
  ╰──────────────╯
"@ | Write-Host -ForegroundColor Magenta
}

function Get-KittyLuchadorResponse {
    param (
        [string]$userInput,
        [bool]$translateToEnglish
    )

    $userInput = $userInput.ToLower()

    $responses = @{
        general = @(
            @{ es = "¡Miau-ravilloso! Pero dime más, humano curioso."; en = "Meow-velous! But tell me more, curious human." },
            @{ es = "¡Con mis garras del destino, te responderé!"; en = "With my claws of destiny, I shall answer you!" }
        )
        fight = @(
            @{ es = "¡El ring tiembla cuando escucho preguntas como esa!"; en = "The ring trembles when I hear questions like that!" },
            @{ es = "¡Eso suena como un reto digno de un campeón felino!"; en = "That sounds like a challenge worthy of a feline champion!" }
        )
        cat = @(
            @{ es = "¡Soy más ágil que cualquier gato callejero!"; en = "I'm more agile than any alley cat!" },
            @{ es = "¡Mis bigotes detectan la verdad en tus palabras!"; en = "My whiskers detect the truth in your words!" }
        )
        mask = @(
            @{ es = "¡Mi máscara es símbolo de honor y misterio!"; en = "My mask is a symbol of honor and mystery!" },
            @{ es = "¡Nunca me quito la máscara, ni para dormir!"; en = "I never take off my mask, not even to sleep!" }
        )
        greet = @(
            @{ es = "¡Hola, valiente humano! ¿Listo para la lucha?"; en = "Hello, brave human! Ready for the fight?" },
            @{ es = "¡Saludos desde el cuadrilátero felino!"; en = "Greetings from the feline ring!" }
        )
        bye = @(
            @{ es = "¡Hasta la próxima batalla, luchador del alma!"; en = "Until the next battle, soul wrestler!" },
            @{ es = "¡El Gato Supremo se despide con un salto elegante!"; en = "El Gato Supremo bows out with a graceful leap!" }
        )
        help = @(
            @{ es = "Comandos disponibles: 'salir' para terminar, 'cambiar idioma' para cambiar el idioma, 'ayuda' para mostrar esta lista."; en = "Available commands: 'exit' to end, 'switch language' to change language, 'help' to show this list." }
        )
    }

    $category = "general"
    if ($userInput -match "fight|battle|arena|wrestle|pelea|batalla|lucha|ring") {
        $category = "fight"
    }
    elseif ($userInput -match "cat|kitten|kitty|meow|gato|gatito|miau") {
        $category = "cat"
    }
    elseif ($userInput -match "mask|costume|luchador|máscara|disfraz") {
        $category = "mask"
    }
    elseif ($userInput -match "hello|hi|hey|hola|saludos|buenas") {
        $category = "greet"
    }
    elseif ($userInput -match "bye|exit|leave|adios|salir|chao|hasta") {
        $category = "bye"
    }
    elseif ($userInput -match "help|ayuda") {
        $category = "help"
    }

    $chosen = Get-Random -InputObject $responses[$category]
    return $translateToEnglish ? $chosen.en : $chosen.es
}

Clear-Host
Show-LuchadorMask

Write-Host "`n🐾 ¡Bienvenido al Chat con El Gato Supremo, el luchador felino! 🐱"
$languageChoice = Read-Host "¿Quieres las respuestas en inglés? (s/n)"
$translateToEnglish = $false
if ($languageChoice -eq "s" -or $languageChoice -eq "y") {
    $translateToEnglish = $true
    Write-Host "`nEl Gato Supremo will now speak in English! 🐾`n"
} else {
    Write-Host "`n¡El Gato Supremo hablará en español! 🐾`n"
}

Write-Host ($translateToEnglish ? "Type 'exit' to end the conversation, 'switch language' to change language, 'help' to show available commands." : "Escribe 'salir' para terminar la conversación, 'cambiar idioma' para cambiar el idioma, 'ayuda' para mostrar los comandos disponibles.`n")

while ($true) {
    $userInput = Read-Host ($translateToEnglish ? "You" : "Tú")

    if ($userInput -eq "exit" -or $userInput -eq "salir") {
        Write-Host ($translateToEnglish ? "Until our next battle in the ring, brave human! 🐾" : "¡Hasta la próxima batalla en el ring, valiente humano! 🐾")
        break
    }
    elseif ($userInput -eq "switch language" -or $userInput -eq "cambiar idioma") {
        $translateToEnglish = -not $translateToEnglish
        Write-Host ($translateToEnglish ? "`nEl Gato Supremo will now speak in English! 🐾`n" : "`n¡El Gato Supremo hablará en español! 🐾`n")
        Write-Host ($translateToEnglish ? "Type 'exit' to end the conversation, 'switch language' to change language, 'help' to show available commands." : "Escribe 'salir' para terminar la conversación, 'cambiar idioma' para cambiar el idioma, 'ayuda' para mostrar los comandos disponibles.`n")
    }
    elseif ($userInput -eq "help" -or $userInput -eq "ayuda") {
        Write-Host (Get-KittyLuchadorResponse -userInput $userInput -translateToEnglish:$translateToEnglish)
    }
    else {
        $response = Get-KittyLuchadorResponse -userInput $userInput -translateToEnglish:$translateToEnglish
        Write-Host "El Gato Supremo: $response`n"
    }
}
