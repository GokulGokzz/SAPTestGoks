*&---------------------------------------------------------------------*
*& Report ZGOKS_TEST
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZGOKS_TEST.


*data: unix_command(50) type c value 'ls -ls /usr/bin'.
*data: unix_command(50) type c value 'ls /hana/shared/H41/xs/sapjvm_8/jre/bin/java/'.
data: unix_command(50) type c value 'sudo ss -tulnp'.

data: begin of internal_table occurs 0,
      line(200),
    end of internal_table.

*PARAMETERS UNIXCOMM LIKE unix_command
*                    DEFAULT 'ls -ls /usr/sap/trans/data' LOWER CASE.

call 'SYSTEM' id 'COMMAND' field  unix_command
       id 'TAB'   field  internal_table-*SYS*.

EDITOR-CALL FOR INTERNAL_TABLE DISPLAY-MODE.