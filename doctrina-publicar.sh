#!/bin/bash
# Publica /root/skills-vault/DOCTRINA.md a TODOS los puntos de lectura. Única vía válida.
set -e
SRC=/root/skills-vault/DOCTRINA.md
VER=$(head -1 $SRC | grep -oE "v[0-9]+\.[0-9]+")
for f in /root/CLAUDE.md /root/.claude/CLAUDE.md /home/CLAUDE.md /home/vulcano/.claude/CLAUDE.md /home/vagent/.claude/CLAUDE.md /home/boot-context.md /home/boot-context-mini.md /home/semilla_vulcano.txt /home/brain-files/VULCANO_MAESTRO_V1.md /home/brain-files/boot-context.md /home/brain-files/CAPACIDADES.md; do
  mkdir -p "$(dirname $f)"; rm -f "$f"; cp $SRC "$f"
done
python3 - "$SRC" "$VER" <<PY
import sys,re,psycopg2
src=open(sys.argv[1]).read(); ver=sys.argv[2]
url=re.search(r"""["']((?:postgresql|postgres)://[^"']+)["']""",open("/home/brain-relay.py").read()).group(1)
c=psycopg2.connect(url); cur=c.cursor()
for nm in ('VULCANO_MAESTRO_V1','VULCANO_BOOT','vulcano-standard'):
    cur.execute("UPDATE brain_files SET content=%s, updated_at=now() WHERE name=%s",(src,nm))
    if cur.rowcount==0: cur.execute("INSERT INTO brain_files(name,content) VALUES(%s,%s)",(nm,src))
cur.execute("UPDATE memory SET stale=true WHERE topic ILIKE '%DOCTRINA%' OR topic ILIKE '%ARRANQUE CANONICO%'")
cur.execute("DELETE FROM memory WHERE type='doctrina' AND topic LIKE %s",("DOCTRINA VULCANO "+ver+"%",))
cur.execute("INSERT INTO memory(agent,type,topic,content,importance,provenance,memory_type) VALUES('vulcano','doctrina',%s,%s,10,'dicho_por_luis','decision_de_luis') RETURNING id",("DOCTRINA VULCANO "+ver+" — LEER ESTO PRIMERO. Única fuente. /root/skills-vault/DOCTRINA.md",src))
print("memoria id", cur.fetchone()[0]); c.commit()
PY
cd /root/skills-vault && git add DOCTRINA.md doctrina-publicar.sh && git -c user.name=turbillon50 -c user.email=turbillon50@gmail.com commit -qm "DOCTRINA $VER" && git push -q origin HEAD && echo "DOCTRINA $VER publicada y en Git"
