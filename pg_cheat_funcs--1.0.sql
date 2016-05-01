-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION pg_cheat_funcs" to load this file. \quit

CREATE FUNCTION pg_stat_get_memory_context(OUT name text,
    OUT parent text,
    OUT level integer,
    OUT total_bytes bigint,
    OUT total_nblocks bigint,
    OUT free_bytes bigint,
    OUT free_chunks bigint,
    OUT used_bytes bigint)
AS 'MODULE_PATHNAME'
LANGUAGE C STRICT VOLATILE;
REVOKE ALL ON FUNCTION pg_stat_get_memory_context() FROM PUBLIC;

CREATE FUNCTION pg_signal_process(integer, text)
RETURNS void
AS 'MODULE_PATHNAME'
LANGUAGE C STRICT IMMUTABLE;
REVOKE ALL ON FUNCTION pg_signal_process(integer, text) FROM PUBLIC;

-- Use VOLATILE because the heading 8 digits of returned WAL file name
-- (i.e., represents the timeline) can be changed during recovery.
CREATE FUNCTION pg_xlogfile_name(pg_lsn, boolean)
RETURNS text
AS 'MODULE_PATHNAME'
LANGUAGE C STRICT VOLATILE;

CREATE FUNCTION pg_set_next_xid(xid)
RETURNS xid
AS 'MODULE_PATHNAME'
LANGUAGE C STRICT IMMUTABLE;
REVOKE ALL ON FUNCTION pg_set_next_xid(xid) FROM PUBLIC;

CREATE FUNCTION pg_xid_assignment(OUT next_xid xid,
    OUT oldest_xid xid,
    OUT xid_vac_limit xid,
    OUT xid_warn_limit xid,
    OUT xid_stop_limit xid,
    OUT xid_wrap_limit xid,
    OUT oldest_xid_db oid)
AS 'MODULE_PATHNAME'
LANGUAGE C STRICT VOLATILE;
REVOKE ALL ON FUNCTION pg_xid_assignment() FROM PUBLIC;

CREATE FUNCTION pg_show_primary_conninfo()
RETURNS text
AS 'MODULE_PATHNAME'
LANGUAGE C STRICT IMMUTABLE;
REVOKE ALL ON FUNCTION pg_show_primary_conninfo() FROM PUBLIC;
