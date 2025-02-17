<?php

namespace App\Http\Controllers\Auth\Mine;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Notification;

class NotificationController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        return $request->user()->notification()->get();
    }

    public function getUnseenNotifications(Request $request)
    {
        $user = $request->user();
        $unseenNotifications = $user->notification()->where('status', false)->get();
        return response()->json($unseenNotifications);
    }

    public function markAsSeen($id)
    {
        // Trouver la notification par ID
        $notification = Notification::findOrFail($id);

        // Mettre à jour le champ status à true
        $notification->status = true;
        $notification->save();

        return response()->json([
            'message' => 'Notification marquée comme vue avec succès',
            'notification' => $notification,
        ]);
    }

    public function destroy($id)
    {
        // Recherche la notification par son ID ; lance une exception si non trouvée
        $notification = Notification::findOrFail($id);
    
        // Supprime la notification
        $notification->delete();
    
        // Retourne une réponse JSON avec un message de succès
        return response()->json(['message' => 'Notification(s) supprimée(s) avec succès.']);
    }

    public function restore($id)
    {
        try {
            // Trouver la notification soft-deleted par son ID
            $notification = Notification::withTrashed()->findOrFail($id);

            // Restaurer la notification
            $notification->restore();

            // Retourner une réponse JSON avec un message de succès
            return response()->json(['message' => 'Notification restored successfully.']);
        } catch (\Exception $e) {
            // Retourner une réponse JSON avec une erreur en cas d'échec de la restauration
            return response()->json(['error' => 'Failed to restore Notification.'], 500);
        }
    }


}
