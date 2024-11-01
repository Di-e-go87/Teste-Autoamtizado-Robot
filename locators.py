import random

def gerar_cpf():
    def calcular_digito(digs):
        s = sum(d * w for d, w in zip(digs, range(len(digs) + 1, 1, -1)))
        return 11 - s % 11 if s % 11 > 1 else 0

    cpf = [random.randint(0, 9) for _ in range(9)]
    cpf.append(calcular_digito(cpf))
    cpf.append(calcular_digito(cpf))
    return ''.join(map(str, cpf))


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




def gerar_telefone():
    ddd = random.randint(11, 99)  # Gera um DDD aleatório
    numero = random.randint(900000000, 999999999)  # Gera um número de telefone com 9 dígitos
    return f"({ddd}) {str(numero)[:5]}-{str(numero)[5:]}"  # Formata como (DD) 9XXXX-XXXX





