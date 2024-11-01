import random

def gerar_cpf():
    def calcular_digito(digs):
        s = sum(d * w for d, w in zip(digs, range(len(digs) + 1, 1, -1)))
        return 11 - s % 11 if s % 11 > 1 else 0

    cpf = [random.randint(0, 9) for _ in range(9)]
    cpf.append(calcular_digito(cpf))
    cpf.append(calcular_digito(cpf))
    return ''.join(map(str, cpf))
