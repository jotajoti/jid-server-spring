package info.jotajoti.jid.jidcode

import org.springframework.graphql.data.method.annotation.*
import org.springframework.stereotype.*

@Controller
class JidCodeController {

    @SchemaMapping
    fun value(jidCode: JidCode) = jidCode.code
}