import os
import subprocess
import time
import resource

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
DB_NAME = "StackOverflow"
PSQL_USER = "postgres"
PSQL_PASSWORD = "postgres"
PSQL_HOST = "localhost"
MYSQL_USER = "root"
MYSQL_PASSWORD = "mysql"
RUN_COUNTS = [1]#, 2, 5, 10, 20, 45]



def run_query(command, env=None, measure=False, label=None, stdin=None):
    if not measure:
        return subprocess.run(
            command, env=env, stdin=stdin,
            stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, check=True,
        )

    start = time.perf_counter()
    result = subprocess.run(
        command, env=env, stdin=stdin,
        stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, check=True,
    )
    elapsed = time.perf_counter() - start
    max_rss_kb = resource.getrusage(resource.RUSAGE_CHILDREN).ru_maxrss

    print(f"{label or 'Query'}: {elapsed:.4f}s | maxrss: {max_rss_kb} KB")
    return result, elapsed, max_rss_kb


def run_psql_query(relative_path, measure=False, label=None, recorder=None):
    sql_path = os.path.join(BASE_DIR, relative_path)
    if not os.path.isfile(sql_path):
        raise FileNotFoundError(f"SQL file not found: {sql_path}")

    print(f"[PostgreSQL] Executando: {relative_path}", flush=True)
    env = {**os.environ, "PGPASSWORD": PSQL_PASSWORD}
    command = ["psql", "-h", PSQL_HOST, "-U", PSQL_USER, "-d", DB_NAME, "-f", sql_path]

    if measure:
        result, elapsed, max_rss_kb = run_query(command, env=env, measure=True, label=label)
        if recorder:
            recorder.write(elapsed, max_rss_kb, label)
        print(f"[PostgreSQL] Finalizado: {relative_path}", flush=True)
        return result

    run_query(command, env=env)
    print(f"[PostgreSQL] Finalizado: {relative_path}", flush=True)


def run_mysql_query(relative_path, measure=False, label=None, recorder=None):
    sql_path = os.path.join(BASE_DIR, relative_path)
    if not os.path.isfile(sql_path):
        raise FileNotFoundError(f"SQL file not found: {sql_path}")

    print(f"[MySQL] Executando: {relative_path}", flush=True)
    command = ["mysql", "-u", MYSQL_USER, f"-p{MYSQL_PASSWORD}", DB_NAME]

    with open(sql_path, "rb") as sql_file:
        if measure:
            result, elapsed, max_rss_kb = run_query(command, measure=True, label=label, stdin=sql_file)
            if recorder:
                recorder.write(elapsed, max_rss_kb, label)
            print(f"[MySQL] Finalizado: {relative_path}", flush=True)
            return result

        run_query(command, stdin=sql_file)

    print(f"[MySQL] Finalizado: {relative_path}", flush=True)


class CsvRecorder:
    def __init__(self, csv_path):
        self.csv_path = csv_path
        if not os.path.exists(csv_path):
            with open(csv_path, "w", encoding="utf-8") as f:
                f.write("time,ram,name_of_query\n")

    def write(self, elapsed, ram_kb, name):
        with open(self.csv_path, "a", encoding="utf-8") as f:
            f.write(f"{elapsed:.6f},{ram_kb},{name}\n")



def test_dml(label, setup_psql, setup_mysql, run_psql, run_mysql, teardown_psql, teardown_mysql, runs, recorder):
    for _ in range(runs):
        run_psql_query(setup_psql)
        run_psql_query(run_psql, measure=True, label=f"{label}_PostgreSQL", recorder=recorder)

        #run_mysql_query(setup_mysql)
#        run_mysql_query(run_mysql, measure=True, label=f"{label}_MySQL", recorder=recorder)

    run_psql_query(teardown_psql)
    #run_mysql_query(teardown_mysql)


def test_delete(runs, recorder):
    test_dml(
        label="DELETE",
        setup_psql="delete/create_tables_for_delete_psql.sql",
        setup_mysql="delete/create_tables_for_delete_mysql.sql",
        run_psql="delete/remocao_psql.sql",
        run_mysql="delete/remocao_mysql.sql",
        teardown_psql="delete/drop_tables_for_delete_psql.sql",
        teardown_mysql="delete/drop_tables_for_delete_mysql.sql",
        runs=runs,
        recorder=recorder,
    )


def test_update(runs, recorder):
    test_dml(
        label="UPDATE",
        setup_psql="update/create_tables_for_update_psql.sql",
        setup_mysql="update/create_tables_for_update_mysql.sql",
        run_psql="update/update_psql.sql",
        run_mysql="update/update_mysql.sql",
        teardown_psql="update/drop_tables_for_update_psql.sql",
        teardown_mysql="update/drop_tables_for_update_mysql.sql",
        runs=runs,
        recorder=recorder,
    )


def test_insert(runs, recorder):
    test_dml(
        label="INSERT",
        setup_psql="insert/create_tables_for_insert_psql.sql",
        setup_mysql="insert/create_tables_for_insert_mysql.sql",
        run_psql="insert/inserts_psql.sql",
        run_mysql="insert/inserts_mysql.sql",
        teardown_psql="insert/drop_tables_for_insert_psql.sql",
        teardown_mysql="insert/drop_tables_for_insert_mysql.sql",
        runs=runs,
        recorder=recorder,
    )



def run_busca(label, psql_path, mysql_path, recorder):
    run_psql_query(psql_path, measure=True, label=f"{label}_PostgreSQL", recorder=recorder)
    #run_mysql_query(mysql_path, measure=True, label=f"{label}_MySQL", recorder=recorder)


def run_busca_com_index(label, index_type, create_psql, create_mysql, query_psql, query_mysql, runs, recorder):
    run_psql_query(create_psql, measure=False, label=f"{label}_PostgreSQL", recorder=recorder)
    #run_mysql_query(create_mysql, measure=False, label=f"{label}_MySQL", recorder=recorder)
    for _ in range(runs):
      run_busca(label, query_psql, query_mysql, recorder)

    if index_type == "hash":
        run_psql_query("create_indexes/drop_hash_tables_psql.sql")
        #run_mysql_query("create_indexes/drop_hash_tables_mysql.sql")
    elif index_type == "b_plus":
        run_psql_query("create_indexes/drop_b_plus_tables_psql.sql")
        #run_mysql_query("create_indexes/drop_b_plus_tables_mysql.sql")



def test_busca_chave_primaria(runs, recorder):
    base = "buscas/chave-primaria_faixa_chaves_primarias"
    query_psql = f"{base}/buscas_por_id_psql.sql"
    query_mysql = f"{base}/buscas_por_id_mysql.sql"

    for _ in range(runs):
        run_busca("BUSCA_SEM_INDEX_CHAVE_PRIMARIA", query_psql, query_mysql, recorder)

    run_busca_com_index(
        label="BUSCA_HASH_CHAVE_PRIMARIA", index_type="hash",
        create_psql=f"{base}/create_hash_indexes_psql.sql",
        create_mysql=f"{base}/create_hash_indexes_mysql.sql",
        query_psql=query_psql, query_mysql=query_mysql,
        runs=runs, recorder=recorder,
    )
    run_busca_com_index(
        label="BUSCA_HASH_INDEX_NAO_IDEAL_CHAVE_PRIMARIA", index_type="hash",
        create_psql=f"{base}/create_hash_indexes_extra_psql.sql",
        create_mysql=f"{base}/create_hash_indexes_extra_mysql.sql",
        query_psql=query_psql, query_mysql=query_mysql,
        runs=runs, recorder=recorder,
    )
    run_busca_com_index(
        label="BUSCA_B_PLUS_INDEX_NAO_IDEAL_CHAVE_PRIMARIA", index_type="b_plus",
        create_psql=f"{base}/create_b_plus_indexes_extra_psql.sql",
        create_mysql=f"{base}/create_b_plus_indexes_extra_mysql.sql",
        query_psql=query_psql, query_mysql=query_mysql,
        runs=runs, recorder=recorder,
    )


def test_busca_com_like(runs, recorder):
    base = "buscas/com_like"
    query_psql = f"{base}/com_like_psql.sql"
    query_mysql = f"{base}/com_like_mysql.sql"

    for _ in range(runs):
        run_busca("BUSCA_SEM_INDEX_COM_LIKE", query_psql, query_mysql, recorder)

    run_busca_com_index(
        label="BUSCA_HASH_COM_LIKE", index_type="hash",
        create_psql=f"{base}/create_hash_indexes_psql.sql",
        create_mysql=f"{base}/create_hash_indexes_mysql.sql",
        query_psql=query_psql, query_mysql=query_mysql,
        runs=runs, recorder=recorder,
    )
    run_busca_com_index(
        label="BUSCA_HASH_INDEX_NAO_IDEAL_COM_LIKE", index_type="hash",
        create_psql=f"{base}/create_hash_indexes_extra_psql.sql",
        create_mysql=f"{base}/create_hash_indexes_extra_mysql.sql",
        query_psql=query_psql, query_mysql=query_mysql,
        runs=runs, recorder=recorder,
    )
    run_busca_com_index(
        label="BUSCA_B_PLUS_COM_LIKE", index_type="b_plus",
        create_psql=f"{base}/create_b_plus_indexes_psql.sql",
        create_mysql=f"{base}/create_b_plus_indexes_mysql.sql",
        query_psql=query_psql, query_mysql=query_mysql,
        runs=runs, recorder=recorder,
    )
    run_busca_com_index(
        label="BUSCA_B_PLUS_INDEX_NAO_IDEAL_COM_LIKE", index_type="b_plus",
        create_psql=f"{base}/create_b_plus_indexes_extra_psql.sql",
        create_mysql=f"{base}/create_b_plus_indexes_extra_mysql.sql",
        query_psql=query_psql, query_mysql=query_mysql,
        runs=runs, recorder=recorder,
    )


def test_busca_com_subconsultas(runs, recorder):
    base = "buscas/com_subconsultas"
    query_psql = f"{base}/com_subconsultas_psql.sql"
    query_mysql = f"{base}/com_subconsultas_mysql.sql"

    for _ in range(runs):
        run_busca("BUSCA_SEM_INDEX_COM_SUBCONSULTAS", query_psql, query_mysql, recorder)

    run_busca_com_index(
        label="BUSCA_HASH_COM_SUBCONSULTAS", index_type="hash",
        create_psql=f"{base}/create_hash_indexes_psql.sql",
        create_mysql=f"{base}/create_hash_indexes_mysql.sql",
        query_psql=query_psql, query_mysql=query_mysql,
        runs=runs, recorder=recorder,
    )
    run_busca_com_index(
        label="BUSCA_HASH_INDEX_NAO_IDEAL_COM_SUBCONSULTAS", index_type="hash",
        create_psql=f"{base}/create_hash_indexes_extra_psql.sql",
        create_mysql=f"{base}/create_hash_indexes_extra_mysql.sql",
        query_psql=query_psql, query_mysql=query_mysql,
        runs=runs, recorder=recorder,
    )
    run_busca_com_index(
        label="BUSCA_B_PLUS_COM_SUBCONSULTAS", index_type="b_plus",
        create_psql=f"{base}/create_b_plus_indexes_psql.sql",
        create_mysql=f"{base}/create_b_plus_indexes_mysql.sql",
        query_psql=query_psql, query_mysql=query_mysql,
        runs=runs, recorder=recorder,
    )
    run_busca_com_index(
        label="BUSCA_B_PLUS_INDEX_NAO_IDEAL_COM_SUBCONSULTAS", index_type="b_plus",
        create_psql=f"{base}/create_b_plus_indexes_extra_psql.sql",
        create_mysql=f"{base}/create_b_plus_indexes_extra_mysql.sql",
        query_psql=query_psql, query_mysql=query_mysql,
        runs=runs, recorder=recorder,
    )


def test_busca_juncoes(runs, recorder):
    base = "buscas/juncoes_e_juncoes_de_juncoes"
    query_psql = f"{base}/juncoes_de_juncoes_psql.sql"
    query_mysql = f"{base}/juncoes_de_juncoes_mysql.sql"

    for _ in range(runs):
        run_busca("BUSCA_SEM_INDEX_JUNCOES", query_psql, query_mysql, recorder)

    run_busca_com_index(
        label="BUSCA_HASH_JUNCOES", index_type="hash",
        create_psql=f"{base}/create_hash_indexes_psql.sql",
        create_mysql=f"{base}/create_hash_indexes_mysql.sql",
        query_psql=query_psql, query_mysql=query_mysql,
        runs=runs, recorder=recorder,
    )
    run_busca_com_index(
        label="BUSCA_HASH_INDEX_NAO_IDEAL_JUNCOES", index_type="hash",
        create_psql=f"{base}/create_hash_indexes_extra_psql.sql",
        create_mysql=f"{base}/create_hash_indexes_extra_mysql.sql",
        query_psql=query_psql, query_mysql=query_mysql,
        runs=runs, recorder=recorder,
    )
    run_busca_com_index(
        label="BUSCA_B_PLUS_JUNCOES", index_type="b_plus",
        create_psql=f"{base}/create_b_plus_indexes_psql.sql",
        create_mysql=f"{base}/create_b_plus_indexes_mysql.sql",
        query_psql=query_psql, query_mysql=query_mysql,
        runs=runs, recorder=recorder,
    )
    run_busca_com_index(
        label="BUSCA_B_PLUS_INDEX_NAO_IDEAL_JUNCOES", index_type="b_plus",
        create_psql=f"{base}/create_b_plus_indexes_extra_psql.sql",
        create_mysql=f"{base}/create_b_plus_indexes_extra_mysql.sql",
        query_psql=query_psql, query_mysql=query_mysql,
        runs=runs, recorder=recorder,
    )


def test_busca_nao_chave_primarias(runs, recorder):
    base = "buscas/nao_chave-primarias_com_selecoes_compostas"
    query_psql = f"{base}/nao_chave-primarias_psql.sql"
    query_mysql = f"{base}/nao_chave-primarias_mysql.sql"

    for _ in range(runs):
        run_busca("BUSCA_SEM_INDEX_NAO_CHAVE_PRIMARIAS", query_psql, query_mysql, recorder)

    run_busca_com_index(
        label="BUSCA_HASH_NAO_CHAVE_PRIMARIAS", index_type="hash",
        create_psql=f"{base}/create_hash_indexes_psql.sql",
        create_mysql=f"{base}/create_hash_indexes_mysql.sql",
        query_psql=query_psql, query_mysql=query_mysql,
        runs=runs, recorder=recorder,
    )
    run_busca_com_index(
        label="BUSCA_HASH_INDEX_NAO_IDEAL_NAO_CHAVE_PRIMARIAS", index_type="hash",
        create_psql=f"{base}/create_hash_indexes_extra_psql.sql",
        create_mysql=f"{base}/create_hash_indexes_extra_mysql.sql",
        query_psql=query_psql, query_mysql=query_mysql,
        runs=runs, recorder=recorder,
    )
    run_busca_com_index(
        label="BUSCA_B_PLUS_NAO_CHAVE_PRIMARIAS", index_type="b_plus",
        create_psql=f"{base}/create_b_plus_indexes_psql.sql",
        create_mysql=f"{base}/create_b_plus_indexes_mysql.sql",
        query_psql=query_psql, query_mysql=query_mysql,
        runs=runs, recorder=recorder,
    )
    run_busca_com_index(
        label="BUSCA_B_PLUS_INDEX_NAO_IDEAL_NAO_CHAVE_PRIMARIAS", index_type="b_plus",
        create_psql=f"{base}/create_b_plus_indexes_extra_psql.sql",
        create_mysql=f"{base}/create_b_plus_indexes_extra_mysql.sql",
        query_psql=query_psql, query_mysql=query_mysql,
        runs=runs, recorder=recorder,
    )


def test_busca_agrupamentos(runs, recorder):
    base = "buscas/operacoes_de_agrupamento_e_agregacoes"
    query_psql = f"{base}/agrupamentos_e_operacoes_psql.sql"
    query_mysql = f"{base}/agrupamentos_e_operacoes_mysql.sql"

    for _ in range(runs):
        run_busca("BUSCA_SEM_INDEX_AGRUPAMENTOS", query_psql, query_mysql, recorder)

    run_busca_com_index(
        label="BUSCA_HASH_AGRUPAMENTOS", index_type="hash",
        create_psql=f"{base}/create_hash_indexes_psql.sql",
        create_mysql=f"{base}/create_hash_indexes_mysql.sql",
        query_psql=query_psql, query_mysql=query_mysql,
        runs=runs, recorder=recorder,
    )
    run_busca_com_index(
        label="BUSCA_HASH_INDEX_NAO_IDEAL_AGRUPAMENTOS", index_type="hash",
        create_psql=f"{base}/create_hash_indexes_extra_psql.sql",
        create_mysql=f"{base}/create_hash_indexes_extra_mysql.sql",
        query_psql=query_psql, query_mysql=query_mysql,
        runs=runs, recorder=recorder,
    )
    run_busca_com_index(
        label="BUSCA_B_PLUS_AGRUPAMENTOS", index_type="b_plus",
        create_psql=f"{base}/create_b_plus_indexes_psql.sql",
        create_mysql=f"{base}/create_b_plus_indexes_mysql.sql",
        query_psql=query_psql, query_mysql=query_mysql,
        runs=runs, recorder=recorder,
    )
    run_busca_com_index(
        label="BUSCA_B_PLUS_INDEX_NAO_IDEAL_AGRUPAMENTOS", index_type="b_plus",
        create_psql=f"{base}/create_b_plus_indexes_extra_psql.sql",
        create_mysql=f"{base}/create_b_plus_indexes_extra_mysql.sql",
        query_psql=query_psql, query_mysql=query_mysql,
        runs=runs, recorder=recorder,
    )



def main():
    for runs in RUN_COUNTS:
        results_dir = os.path.join(BASE_DIR, "results")
        os.makedirs(results_dir, exist_ok=True)

        recorder = CsvRecorder(os.path.join(results_dir, f"{runs}_times.csv"))

        test_delete(runs, recorder)
        test_update(runs, recorder)
        test_insert(runs, recorder)

        test_busca_chave_primaria(runs, recorder)
        test_busca_com_like(runs, recorder)
        test_busca_com_subconsultas(runs, recorder)
        test_busca_juncoes(runs, recorder)
        test_busca_nao_chave_primarias(runs, recorder)
        tedst_busca_agrupamentos(runs, recorder)


if __name__ == "__main__":
    main()