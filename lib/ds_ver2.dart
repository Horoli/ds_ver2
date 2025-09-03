// Barrel file to curate exports across the app.
// Note: prefer `export` over `library/part` to keep modules encapsulated.
// Keep this list minimal; expose read-only providers and entities.

// Core network
export 'core/network/api_client.dart' show ApiClient, DioApiClient, defaultDio;

// Auth (read-only)
export 'features/login/providers/providers.dart' show currentUserProvider;
export 'core/user/user.dart' show User;
