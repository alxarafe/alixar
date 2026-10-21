package es.alxarafe.alixar.audit;

import es.alxarafe.alixar.audit.application.AuditEventRepository;
import es.alxarafe.alixar.audit.domain.AuditChain;
import es.alxarafe.alixar.audit.domain.AuditChainHead;
import es.alxarafe.alixar.audit.domain.AuditEvent;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

public class InMemoryAuditEventRepository implements AuditEventRepository {

    private final Map<UUID, AuditChainHead> chainHeads = new HashMap<>();
    private final Map<UUID, List<AuditEvent>> events = new HashMap<>();

    public synchronized void seedChain(UUID chainId) {
        chainHeads.put(chainId, new AuditChainHead(chainId, 0, AuditChain.GENESIS_HASH));
        events.put(chainId, new ArrayList<>());
    }

    public synchronized void replaceEvent(UUID chainId, long sequence, AuditEvent replacement) {
        List<AuditEvent> chainEvents = events.get(chainId);
        for (int index = 0; index < chainEvents.size(); index++) {
            if (chainEvents.get(index).sequence() == sequence) {
                chainEvents.set(index, replacement);
                return;
            }
        }
        throw new IllegalArgumentException("Audit event not found: " + sequence);
    }

    public synchronized void deleteEvent(UUID chainId, long sequence) {
        events.get(chainId).removeIf(event -> event.sequence() == sequence);
    }

    public synchronized List<AuditEvent> events(UUID chainId) {
        return List.copyOf(events.getOrDefault(chainId, List.of()));
    }

    @Override
    public synchronized Optional<AuditChainHead> lockChainHead(UUID chainId) {
        return Optional.ofNullable(chainHeads.get(chainId));
    }

    @Override
    public synchronized Optional<AuditChainHead> findChainHead(UUID chainId) {
        return Optional.ofNullable(chainHeads.get(chainId));
    }

    @Override
    public synchronized void insert(AuditEvent event) {
        events.computeIfAbsent(event.chainId(), key -> new ArrayList<>()).add(event);
    }

    @Override
    public synchronized void updateChainHead(AuditChainHead head) {
        chainHeads.put(head.chainId(), head);
    }

    @Override
    public synchronized List<AuditEvent> readEvents(UUID chainId, long afterSequence, int limit) {
        return events.getOrDefault(chainId, List.of()).stream()
            .filter(event -> event.sequence() > afterSequence)
            .sorted(Comparator.comparingLong(AuditEvent::sequence))
            .limit(limit)
            .toList();
    }
}
