import SwiftUI

@main
struct OpenBoringBarApp: App {
    @StateObject private var permissionManager = PermissionManager()
    @StateObject private var runtimeCoordinator = AppRuntimeCoordinator()

    var body: some Scene {
        WindowGroup {
            BootstrapView()
                .environmentObject(runtimeCoordinator)
        }
        .windowResizability(.contentSize)

        Settings {
            PermissionSetupView()
                .environmentObject(permissionManager)
                .frame(width: 500, height: 590)
        }
    }
}

private struct BootstrapView: View {
    @EnvironmentObject private var runtimeCoordinator: AppRuntimeCoordinator

    var body: some View {
        Color.clear
            .frame(width: 1, height: 1)
            .accessibilityHidden(true)
            .task {
                runtimeCoordinator.startBarManagerIfNeeded()
                runtimeCoordinator.startPanelsIfNeeded()
            }
    }
}
