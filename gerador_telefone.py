import random

def gerar_telefone():
    ddd = random.randint(11, 99)  # Gera um DDD aleatório
    numero = random.randint(900000000, 999999999)  # Gera um número de telefone com 9 dígitos
    return f"({ddd}) {str(numero)[:5]}-{str(numero)[5:]}"  # Formata como (DD) 9XXXX-XXXX

