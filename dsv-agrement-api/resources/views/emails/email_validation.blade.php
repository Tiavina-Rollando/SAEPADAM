<!DOCTYPE html>
<html>
<head>
    <!-- Condition pour afficher le code de validation -->
    @if ($model=="code")
        <title>Validation de l'adresse e-mail</title>
    @endif

    <!-- Condition pour afficher le mot de passe provisoire -->
    @if ($model=="password")
        <title>Mot de passe provisoire</title>
    @endif    
</head>
<body>
    <p>Bonjour,</p>
    <!-- Condition pour afficher le code de validation -->
    @if ($model=="code")
        <p>Voici votre code de validation: {{ $code }}</p>
    @endif

    <!-- Condition pour afficher le mot de passe provisoire -->
    @if ($model=="password")
        <p>Voici votre mot de passe provisoire: {{ $code }}</p>
        <p>Vous pouvez le réinitialiser une fois sur l'application web</p>
    @endif
    <p>Cordialement,</p>
</body>
</html>
