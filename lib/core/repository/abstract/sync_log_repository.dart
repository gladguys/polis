abstract class SyncLogRepository {
  Future<String> getPartidoHash();
  Future<String> getPoliticoHash();
  Future<String> getOrgaoHash();
}
