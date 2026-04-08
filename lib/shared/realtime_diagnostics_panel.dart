import 'package:chatface/Riverpod/Providers/all_providers.dart';
import 'package:chatface/Services/realtime_gateway.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RealtimeDiagnosticsPanel extends ConsumerStatefulWidget {
  const RealtimeDiagnosticsPanel({super.key, required this.scopeLabel});

  final String scopeLabel;

  @override
  ConsumerState<RealtimeDiagnosticsPanel> createState() =>
      _RealtimeDiagnosticsPanelState();
}

class _RealtimeDiagnosticsPanelState
    extends ConsumerState<RealtimeDiagnosticsPanel> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    final gateway = ref.read(AllProviders.realtimeGatewayProvider);

    return ValueListenableBuilder<RealtimeDiagnosticsSnapshot>(
      valueListenable: gateway.diagnosticsListenable,
      builder: (context, snapshot, _) {
        final statusColor = _statusColor(snapshot.status);

        return Material(
          color: Colors.transparent,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 280),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.72),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: statusColor.withValues(alpha: 0.75)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.28),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => setState(() => _isExpanded = !_isExpanded),
                    child: Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: statusColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            '${widget.scopeLabel} net: ${snapshot.statusLabel}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Icon(
                          _isExpanded ? Icons.expand_less : Icons.expand_more,
                          color: Colors.white70,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                  if (_isExpanded) ...[
                    const SizedBox(height: 8),
                    _InfoLine(label: 'api', value: snapshot.apiBaseUrl),
                    _InfoLine(label: 'ws', value: snapshot.realtimeBaseUrl),
                    _InfoLine(
                      label: 'url',
                      value: snapshot.websocketUrl ?? '-',
                    ),
                    _InfoLine(
                      label: 'ready',
                      value: snapshot.sessionReady ? 'yes' : 'no',
                    ),
                    _InfoLine(
                      label: 'session',
                      value: snapshot.sessionId ?? '-',
                    ),
                    _InfoLine(label: 'lang', value: snapshot.language ?? '-'),
                    _InfoLine(label: 'mode', value: snapshot.mode ?? '-'),
                    _InfoLine(
                      label: 'event',
                      value: snapshot.lastEventType ?? '-',
                    ),
                    _InfoLine(
                      label: 'retry',
                      value: snapshot.reconnectAttempts.toString(),
                    ),
                    _InfoLine(
                      label: 'updated',
                      value: _formatTime(snapshot.updatedAt),
                    ),
                    if (snapshot.lastError != null &&
                        snapshot.lastError!.trim().isNotEmpty) ...[
                      const SizedBox(height: 6),
                      Text(
                        snapshot.lastError!,
                        style: TextStyle(
                          color: Colors.red.shade200,
                          fontSize: 11,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Color _statusColor(RealtimeConnectionStatus status) => switch (status) {
    RealtimeConnectionStatus.idle => Colors.white54,
    RealtimeConnectionStatus.connecting => Colors.amber,
    RealtimeConnectionStatus.socketReady => Colors.lightBlueAccent,
    RealtimeConnectionStatus.sessionReady => Colors.greenAccent,
    RealtimeConnectionStatus.reconnecting => Colors.orangeAccent,
    RealtimeConnectionStatus.disconnected => Colors.deepOrangeAccent,
    RealtimeConnectionStatus.error => Colors.redAccent,
  };

  String _formatTime(DateTime? value) {
    if (value == null) {
      return '-';
    }

    final hour = value.hour.toString().padLeft(2, '0');
    final minute = value.minute.toString().padLeft(2, '0');
    final second = value.second.toString().padLeft(2, '0');
    return '$hour:$minute:$second';
  }
}

class _InfoLine extends StatelessWidget {
  const _InfoLine({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$label: ',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
            TextSpan(
              text: value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
