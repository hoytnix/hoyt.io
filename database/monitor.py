from os.path import join, dirname, abspath
from subprocess import check_output
from time import sleep, strftime

import psycopg2

CONFIG = {
    'host': 'localhost',
    'port': '5432',
    'dbname': 'hoyt',
    'user': 'postgres'
}


def current_time():
    return strftime('%H:%M:%S')


def main():
    initial_startup = True
    count = 0
    while True:
        # Check if the database is running.
        try:
            dsn = ' '.join(['{}={}'.format(k, CONFIG[k]) for k in CONFIG])
            conn = psycopg2.connect(dsn)
            conn.close()
        except psycopg2.OperationalError:
            # Attempt to gracefully wait for the database to startup.
            if initial_startup:
                count += 1
                if count < 10:
                    sleep(1)
                    continue
            break  # Kills the script if it isn't running.

        # Check if there are any changes.
        backup_file = join(dirname(abspath(__file__)), 'backup.sql')
        with open(backup_file, 'r') as stream:
            current_backup = stream.read()

        cmd = 'pg_dump -h {host} -p {port} -U {user} -d {dbname} -w --data-only --inserts'.format(**CONFIG)
        new_backup = check_output(cmd, shell=True).decode('utf-8')

        # Replace backup
        if new_backup != current_backup:
            with open(backup_file, 'w+') as stream:
                stream.write(new_backup)
            print('[{}] Backed up the database!'.format(current_time()))

        sleep(1)

    print('[{}] Goodbye!'.format(current_time()))


if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        import sys
        sys.exit(0)
