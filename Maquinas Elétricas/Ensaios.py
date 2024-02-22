import numpy as np
#alimentar as classes com os dados coletados

nf = 3
ligacao = "y"
freq_rede = 60
class vazio:
    tensao = 0
    corrente = 0
    potencia = 0
    aparente = nf*tensao*corrente
    reativa = np.sqrt(np.square(aparente)-np.square(aparente))
    xvz = reativa / (nf * np.square(corrente))

class bloqueado:
    tensao = 0
    corrente = 0
    potencia_ativa =0
    freq_ensaio = 0

class cc:
    leitura_res =0
    if ligacao == "d":
        r1 = 1.5*leitura_res
    else:
        r1 = leitura_res/2

P_rot = (vazio.potencia) - nf*np.square(vazio.corrente)*cc.r1
P_nucleo = vazio.potencia - P_rot - nf*np.square(vazio.corrente)*cc.r1
Res_nucleo = nf*np.square(vazio.tensao)/P_nucleo
