import random

def gerar_nome_masculino():
    nomes_masculinos = [
        "TesteNome", "TesteNome", "TesteNome", "TesteNome", "TesteNome",
        "TesteNome", "TesteNome", "TesteNome", "TesteNome", "TesteNome",
        "TesteNome", "TesteNome", "TesteNome", "TesteNome", "TesteNome",
        "TesteNome", "TesteNome", "TesteNome", "TesteNome", "TesteNome"
    ]
    sobrenomes = [
        "Alves", "da Silva", "Souza", "Pereira", "Lima",
        "Costa", "Barbosa", "Melo", "Nogueira", "Santos",
        "Ribeiro", "Martins", "Oliveira", "Moraes", "Cunha"
    ]
    
    nome = random.choice(nomes_masculinos)
    sobrenome = random.choice(sobrenomes)
    return f"{nome} {sobrenome}"
