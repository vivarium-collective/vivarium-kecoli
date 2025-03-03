def expr_subs(compound_id,db_name):
    expr_subs = f"[c:c<-f^substrates, c={db_name}~{compound_id}]"
    return expr_subs

def expr_subs_full(substrates_list,db_name):
    expr_subs_list = [expr_subs(subs, db_name) for subs in substrates_list]

    expr_subs_full = ",".join(expr_subs_list)
    return expr_subs_full

def expr_sides_same(compound_id,subs0,db_name):
    expr_sides_same = f"(same-side-substrates? (f,{db_name}~{subs0},{db_name}~{compound_id}))"
    return expr_sides_same

def expr_sides_opp(compound_id,subs0,db_name):
    expr_sides_opp = f"(opp-side-substrates? (f,{db_name}~{subs0},{db_name}~{compound_id}))"
    return expr_sides_opp

def expr_sides(substrates,products,db_name):

    expr_sides_same_full = ""
    expr_sides_opp_full = ""

    if len(substrates[1:]) > 0:
        expr_sides_same_list = [expr_sides_same(subs, substrates[0], db_name) for subs in substrates[1:]]
        expr_sides_same_full = ",".join(expr_sides_same_list)

    if len(products) > 0:
        expr_sides_opp_list = [expr_sides_opp(prod, substrates[0], db_name) for prod in products]
        expr_sides_opp_full = ",".join(expr_sides_opp_list)

    if len(expr_sides_same_full)>0:
        expr_sides_full = expr_sides_same_full + ',' + expr_sides_opp_full
    else:
        expr_sides_full = expr_sides_opp_full

    return expr_sides_full

def expr_rxns(substrates,products,db_name='ECOLI'):
    """

    :param substrates: list of substrates, must be BioCyc object IDs
    :param products: list of products, must be BioCyc object IDs
    :param db_name: name of the pathway tools database
    :return: biovelo expression that may return a list of reactions within an XML body
    """



    expr_subs = expr_subs_full(substrates+products,db_name)
    expr_sides_rxn = expr_sides(substrates,products,db_name)

    expr_rxns_full = f"[rxn:f<-{db_name}^^reactions, rxn := f^FRAME-ID, {expr_subs}, {expr_sides_rxn}]"

    return expr_rxns_full
