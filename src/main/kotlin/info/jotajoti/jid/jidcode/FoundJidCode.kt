package info.jotajoti.jid.jidcode

import info.jotajoti.jid.participant.*
import jakarta.persistence.*
import jakarta.persistence.GenerationType.*
import org.hibernate.annotations.*
import org.hibernate.type.*

@Entity
data class FoundJidCode(

    @Id
    @GeneratedValue(strategy = UUID)
    @JdbcTypeCode(SqlTypes.VARCHAR)
    val id: FoundJidCodeId? = null,

    @ManyToOne
    @JoinColumn(name = "participant_id", nullable = false)
    var participant: Participant,

    @Embedded
    var code: JidCode,
)
